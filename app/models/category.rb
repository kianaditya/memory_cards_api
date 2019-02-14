class Category < ApplicationRecord

    has_many :cards

    validates_presence_of :name
end
