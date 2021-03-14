class League < ApplicationRecord
    has_many :events 
    belongs_to :sport 
end
