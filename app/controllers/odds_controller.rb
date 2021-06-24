class OddsController < ApplicationController
    
    def index 
        @sport = Sport.find(params[:sport_id])
        Odd.create_odds(@sport.key, @sport.id)
        @odds = Odd.where("sport_id = ?", params[:sport_id]) 
        @odds = Odd.order('created_at DESC')
    end

    def show 
        @odd = Odd.find(params[:id])
    end
end
