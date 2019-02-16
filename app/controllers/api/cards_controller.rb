class Api::CardsController < ApplicationController

    before_action :authenticate_api_user!

    def index
        cards = current_api_user.cards
        render json: cards, each_serializer: Cards::IndexSerializer
    end
    
    def update
        cards = current_api_user.cards
        @card = cards.find(card_params[:id])
        @card.update_attributes(card_params)
        @card.save
        render json: cards, each_serializer: Cards::IndexSerializer
    end

    def destroy
        cards = current_api_user.cards
        @card = cards.find(card_params[:id])
        @card.destroy
        render json: cards, each_serializer: Cards::IndexSerializer
    end

    private

    def card_params
        params.permit(:id, :user_id, :category_id, :question, :answer)
    end

end