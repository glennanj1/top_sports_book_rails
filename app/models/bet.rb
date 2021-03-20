class Bet < ApplicationRecord
    belongs_to :odd 
    belongs_to :user

    validates :amount, presence: true
    validates :amount, length: { maximum: 1000000 }
    # validates :team, presence: true 
    # validates :odds, presence: true 

    def self.risky_bets
        where('amount > 100')
    end
end
