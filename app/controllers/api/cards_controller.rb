class Api::CardsController < ApplicationController

    def index
        cards = Card.all
        render json: {cards: cards}
    end
end