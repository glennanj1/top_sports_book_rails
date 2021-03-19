class Odd < ApplicationRecord
    belongs_to :sport 
    has_many :bets 

    validates :commence_time, uniqueness: true
    accepts_nested_attributes_for :bets

    
end
