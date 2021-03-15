class OddsController < ApplicationController
    before_action 
    def index 
        @odds = Odd.all 
    end
end
