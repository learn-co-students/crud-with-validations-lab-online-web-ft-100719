class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: { scope: :release_year }
end
