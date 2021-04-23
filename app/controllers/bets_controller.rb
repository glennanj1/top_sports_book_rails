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

    def my_bets 
        if user_signed_in?
            id = current_user.id
          @bets = Bet.my_bets(id)
          if @bets.empty?
            redirect_to root_path, notice: "No Bets at this time.."
          else
            render 'index'
          end
        else
          redirect_to root_path, notice: "You need to sign In!"
        end
      end

    def show 
        @bet = Bet.find(params[:id])
    end

    def new 
        odd = Odd.find(params[:odd_id])
        @selection = odd.odds_selection
        if params[:odd_id] && @odd = Odd.find(params[:odd_id])
            @bet = Bet.new(odd_id: params[:odd_id])
        else
            @bet = Bet.new
        end
    end

    def create 
        odd = Odd.find(params[:odd_id])
        @selection = odd.odds_selection
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
        @selection = @odd.odds_selection
    end

    def update 
        @bet = Bet.find(params[:id])
        @odd = @bet.odd
        @selection = @odd.odds_selection
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

    
    
