class Sport < ApplicationRecord
    
    has_many :odds
    has_many :bets, through: :odds

end
