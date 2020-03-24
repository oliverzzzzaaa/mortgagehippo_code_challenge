class User < ApplicationRecord
    # Assuming a user would sign up with their email address to receive a unique API Key
    # Validate for the presence and uniqueness of the user's email.

    # Validates presence and uniqueness of the API Key
    validates :email, presence: true, uniqueness: true
    validates :api_key, uniqueness: true

    # A user can create many coins
    has_many :coins

    # A user can create many transactions
    has_many :transactions

    # Ensure the user has an API Key assigned. Is also done in the controller for safety
    after_initialize :ensure_api_key
    
    def ensure_api_key
        self.api_key ||= SecureRandom.urlsafe_base64
        self.save!
    end

end
