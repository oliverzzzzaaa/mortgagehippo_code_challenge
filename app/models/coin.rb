class Coin < ApplicationRecord

    # Validate for a unique name, and existence of value and created by
    # Although the created_by isn't required, it could be useful later on

    validates :value, presence: true
    validates :name, presence: true, uniqueness: true
    validates :created_by, presence: true

    belongs_to :user,
    foreign_key: :created_by,
    class_name: :User
end
