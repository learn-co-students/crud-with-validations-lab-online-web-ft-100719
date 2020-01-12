class Song < ApplicationRecord
    validates :tittle, presence:true 
    validates :title,uniqueness:{scope[:release_year,:artist_name],message: "Cannot duplicate songs within the year"}
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validate :release_year_validation 

    def release_year_validation 
        if self.released 
            if !self.release_year
                errors.add(:release_year,"Must have release year")
            else 
                current_year=Time.now.year 
                if current_year < self.release_year 
                    errors.add(:release_year,"Cannot be released beyond thid date")
                end 
            end 
        end
    end
end 



