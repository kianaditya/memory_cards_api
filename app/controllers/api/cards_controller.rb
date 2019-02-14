class Api::CardsController < ApplicationController

    before_action :authenticate_api_user!

    def index
        cards = current_api_user.cards
        render json: cards, each_serializer: Cards::IndexSerializer
    end
end