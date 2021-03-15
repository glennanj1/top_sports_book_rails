class Odd < ApplicationRecord
    belongs_to :sport 
    has_many :bets 
end
