class Profile < ApplicationRecord
    has_many :messages

    validates :name, uniqueness: true
    validates :image, uniqueness: true
end
