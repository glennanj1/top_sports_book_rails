class Bet < ApplicationRecord
    belongs_to :odd 
    belongs_to :user

    validates :amount, presence: true
    validates :amount, length: { maximum: 5 }
    
    validates :team, presence: true
 
    validates :odds, presence: true 

    scope :risky_bets, -> { where('amount > 100')}



    # def self.risky_bets
    #     where('amount > 100')
    # end

    def self.my_bets(id)
        user = User.find(id)
        user.bets
    end

    
end
