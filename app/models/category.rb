class Category < ApplicationRecord

    has_many :cards
    belongs_to :user

    validates_presence_of :name
end
