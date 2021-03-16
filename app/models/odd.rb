class Odd < ApplicationRecord
    belongs_to :sport 
    has_many :bets 
    accepts_nested_attributes_for :bets
end
