class Bet < ApplicationRecord
    belongs_to :odd 
    belongs_to :user
end
