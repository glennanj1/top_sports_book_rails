class Sport < ApplicationRecord
    validates :commence_time, uniqueness: true
    has_many :odds
    has_many :bets, through: :odds

end
