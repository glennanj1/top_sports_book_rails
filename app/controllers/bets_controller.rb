class BetsController < ApplicationController
    before_action :authenticate_user!
    def index
        if params[:odd_id] && @odd = Odd.find(params[:odd_id])
            @bets = @odd.bets 
        else
            @bets = Bet.all
        end
    end

    def risky_bets
        @bets = Bet.risky_bets
        if @bets.empty?
            redirect_to sports_path, notice: "No Risky Bets At This Time....."
        else
            render 'index'
        end
    end

    def show 
        @bet = Bet.find(params[:id])
    end

    def new 
        @odd = Odd.find(params[:odd_id])
        @odds = JSON[@odd.odds]
        @odds_list = @odds.map { |o| o[0]}
        @odds_list1 = @odds.map { |o| o[1] }
        @odds_selection = @odds_list.concat @odds_list1
        
        if params[:odd_id] && @odd = Odd.find(params[:odd_id])
            @bet = Bet.new(odd_id: params[:odd_id])
        else
            @bet = Bet.new
        end
    end

    def create 
        @bet = Bet.new(bet_params)
        @bet.user_id = current_user.id
        @bet.odd_id = params[:odd_id]

        if params[:odd_id]
            @odd = Odd.find(params[:odd_id])
        end
    
        if @bet.save 
            redirect_to odd_bets_path
        else
            render :new 
        end
    end

    def edit 
        @bet = Bet.find(params[:id])
        @odd = @bet.odd
        @o = JSON[@odd.odds]
        @odds_list = @o.map { |o| o[0]}
        @odds_list1 = @o.map { |o| o[1] }
        @odds_selection = @odds_list.concat @odds_list1
    end

    def update 
        @bet = Bet.find(params[:id])
        @bet.update(bet_params)
        if @bet.valid? 
            redirect_to bet_path(@bet), notice: "Successful Update"
        else
            render :edit 
        end
    end

    def destroy
        @bet = Bet.find(params[:id])
        @bet.destroy 
        redirect_to sports_path, notice: "Successful Deletion"
    end

    private

        def bet_params
            params.require(:bet).permit(:amount, :team, :odds)
        end
    
end

    
    
