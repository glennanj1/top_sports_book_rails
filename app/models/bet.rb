class Bet < ApplicationRecord
    belongs_to :odd 
    belongs_to :user

    validates :amount, presence: true, message: "Bet needs an Amount"
    validates :amount, length: { maximum: 1000000 }
    validates :team, presence: true 
    validates :odds, presence: true 
end
