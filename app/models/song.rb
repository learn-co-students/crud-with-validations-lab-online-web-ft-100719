class Song < ApplicationRecord
    validates :title, :artist_name, presence: true 
    validates :title, uniqueness: {scope: :release_year}
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: :released
    validate :release_date_cannot_be_in_the_future

    def release_date_cannot_be_in_the_future 
        if release_year.present? && release_year > Date.current.year 
            errors.add(:release_year, "can't be in the future")
        end 
    end 
end
