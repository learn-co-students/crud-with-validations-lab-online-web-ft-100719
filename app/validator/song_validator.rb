class SongValidator < ActiveModel::Validator

  def validate(song)
    #binding.pry
    time = Time.new
    if song.released != false && song.release_year == nil
      song.errors[:release_year] << "fix date"
    end 

    if song.release_year && song.release_year > time.strftime("%Y").to_i
      song.errors[:release_year] << "Song is invalid when the release year is in the futureeeeeeeee"
    end 
    
    #if Song.all.include?(song) 
      #song.errors[:release_year] << "repeated"
    #end 

    #if song.released == false  
      #song.release_year != nil
      #song.errors[:release_year] << "error"
    #end 
 
  end
    
end 