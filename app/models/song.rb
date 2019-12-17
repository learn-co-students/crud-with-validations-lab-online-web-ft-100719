class Song < ApplicationRecord
  #binding.pry
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :genre, presence: true
  validates :artist_name, presence: true
  #validates :release_year, presence: true 
  #validates :released, presence: true
  
  
  

  #include ActiveModel::Validations
  validates_with SongValidator
  
end
