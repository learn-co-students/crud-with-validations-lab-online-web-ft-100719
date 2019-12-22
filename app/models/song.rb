class Song < ApplicationRecord
    def not_released?
        :released == "false"
    end 
    validates :title, presence: :true
    validates :released, inclusion: { in: %w(true false) }
    validates :release_year, presence: true, unless: :not_released?
    validates :release_year, confirmation: true
    validates :release_year_confirmation, length: { maximum: 2019 }
    validates :artist_name, presence: :true
    validates :genre, presence: :true
end

