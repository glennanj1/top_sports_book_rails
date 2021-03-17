class OddsController < ApplicationController
    before_action 
    def index 
        @odds = Odd.where("sport_id = ?", params[:sport_id]) 
    end

    def show 
        @odd = Odd.find(params[:id])
    end
end
