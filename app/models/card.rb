class Card < ApplicationRecord

    belongs_to :category

    validates_presence_of :question, :answer
end
