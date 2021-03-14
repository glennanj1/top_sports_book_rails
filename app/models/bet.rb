class Bet < ApplicationRecord
    has_many :betslips 
    belongs_to :event 
end
