class HomeController < ApplicationController
    def index
      @products = Spree::Product.limit(6)
    end
  end
