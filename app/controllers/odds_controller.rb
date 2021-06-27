class OddsController < ApplicationController
    
    def index 
        @sport = Sport.find(params[:sport_id])
        Odd.create_odds(@sport.key, @sport.id)
        odd = Odd.where("sport_id = ?", params[:sport_id]) 
        @odds = odd.order(created_at: :desc)
    end

    def show 
        @odd = Odd.find(params[:id])
    end
end
