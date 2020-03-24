class Api::UsersController < ApplicationController

    # Creating a new user 
    def create
        @user = User.new(user_params)
        # Giving the user a random API key
        @user.api_key = SecureRandom.urlsafe_base64
        if @user.save
            # If the user successfully saves (passes all validations)
            render json: @user
        else
            # if invalid user, render the errors in JSON format with HTTP response status of 422 for Unprocessable Entity
            render json: @user.errors.full_messages, status: 422
        end
    end

    private
    # In case you want future User actions. Currently, the only allowed inputs are emails and admin(boolean)
    # Since API key is randomly assigned
    def user_params
        params.require(:user).permit(:email, :admin)
    end

end
