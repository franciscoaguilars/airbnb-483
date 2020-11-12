class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all.order(created_at: :desc)
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save!
            redirect_to restaurant_path(@restaurant)
        else
            render new_restaurant_path
        end
    end

    private
    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end
