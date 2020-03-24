class Api::TransactionsController < ApplicationController
    before_action :require_api_key

    # Require a valid API key before the user is allowed to make any transactions

    # Render a list of all transactions

    def index
        @transactions = Transaction.all
        render json: @transactions
    end

    # Create a new transaction: transaction_id of 1 indicates deposit, 0 indicates withdraw


    def create
        @transaction = Transaction.new(transaction_params)
        # Assigns the correct user_id in case the user puts another user's ID
        @transaction.user_id = User.find_by(api_key: params[:api_key]).id
        if @transaction.save
            @coin = Coin.find(@transaction.coin_id)
            # If deposit, increment @coin's value, else decrement 
            # Also, send email if value is less than 4
            if @transaction.transaction_type == 1
                @coin.update_attributes(value: @coin.value+1)
                if @coin.value < 4
                    LowFundsMailer.low_funds(@coin).deliver
                end
            else
                # If withdraw, must ensure the value is > 0
                if (@coin.value > 0)
                    @coin.update_attributes(value: @coin.value-1)
                    if @coin.value < 4
                        LowFundsMailer.low_funds(@coin).deliver
                    end
                else
                    render json: ["Sorry! There are no more of those coins."], status: 422
                end
            end
            @coin.save
            # Return the transaction 
            render json: @transaction
        else
            render json: @transaction.errors.full_messages, status: 422
        end
    end

    # To show all the transaction matching the API User
    def show
        @transactions = Transaction.where(user_id: params[:id])
        render json: @transactions
    end

    private
    # Only allow these three attributes to be set. 
    def transaction_params
        params.require(:transaction).permit(:transaction_type, :user_id, :coin_id)
    end
end
