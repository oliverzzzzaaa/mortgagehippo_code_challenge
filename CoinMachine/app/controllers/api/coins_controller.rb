class Api::CoinsController < ApplicationController
    before_action :require_api_key
    
    # Require a valid API key before any coin action can be taken

    # Index returns all the coins
    def index
        @coins = Coin.all
        render json: @coins
    end

    # Show returns the coin with the matching ID

    def show
        @coin = Coin.find(params[:id])
        render json: @coin
    end

    # Create is to create a new coin. Returns the coin if saved. Else renders the errors

    def create
        @coin = Coin.new(coin_params)
        # Although I allow a user_id to be set, I will manually set it to the 
        # user with the matching API key, so I can't put another user's ID
        @coin.created_by = User.find_by(api_key: params[:api_key]).id
        if @coin.save
            render json: @coin
        else
            render json: @coin.errors.full_messages, status: 422
        end
    end

    # Update allows users to update attribtues of existing coins

    def update
        @coin = Coin.find(params[:id])
        if @coin.update_attributes(coin_params)
            render json: @coin
        else
            render json: ['Oops! Attributes could not be updated']
        end
    end

    # Destroy allows users to delete coins

    def destroy
        @coin = Coin.find(params[:id])
        if @coin
            @coin.destroy
            render json: @coin.id
        else
            render json: ["No coin with the matching ID can be found"]
        end
    end

    # Count is a custom route that displays the total value of all the coins

    def count
        @values = Coin.sum(:value)
        render json: @values
    end


    private

    def coin_params
        params.require(:coin).permit(:value, :name, :created_by)
    end
end
