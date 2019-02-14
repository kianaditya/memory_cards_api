class Card < ApplicationRecord

    belongs_to :category
    belongs_to :user

    validates_presence_of :question, :answer
end
