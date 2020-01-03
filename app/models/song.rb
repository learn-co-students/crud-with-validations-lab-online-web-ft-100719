class Song < ApplicationRecord
  
  validates :artist_name, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released? 
end