class ReservationsController < ApplicationController
    before_action :authenticate_user!

    def index
      @reservations = current_user.reservations
    end

    def new
      @reservation = Reservation.new
    end

    def create
      @reservation = current_user.reservations.build(reservation_params)
      if @reservation.save
        redirect_to reservations_path, notice: 'Reservation was successfully created.'
      else
        render :new
      end
    end

    private

    def reservation_params
      params.require(:reservation).permit(:start_time, :end_time, :status)
    end
  end
