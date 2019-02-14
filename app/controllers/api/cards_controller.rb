class Api::CardsController < ApplicationController

    def index
        cards = Card.all
        render json: cards, each_serializer: Cards::IndexSerializer
    end
end