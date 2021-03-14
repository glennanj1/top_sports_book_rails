class Event < ApplicationRecord
    has_many :bets 
    belongs_to :league
end
