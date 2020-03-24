class Transaction < ApplicationRecord

    # Validate that each of these columns aren't blank
    # In this case, transaction_type of 1 is deposit, and 0 is withdraw
    # In the future, 2 and 3 could be added for additional actions
    validates :coin_id, :user_id, :transaction_type, presence: true

    # Each transaction has a user, and a coin involved. 
    belongs_to :coin
    belongs_to :user
end
