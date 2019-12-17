class SongsController < ApplicationController

  def index 
    @songs = Song.all
  end 

  def new 
    @song = Song.new 
  end 

  def create 
    #binding.pry
    @song = Song.new(song_params)
    if @song.save  
      redirect_to song_path(@song)
    else 
      render :new
    end
  end 

  def show 
    @song = Song.find(params[:id])
  end  
  def edit 
    @song = Song.find(params[:id])
  end

  def update 
    #binding.pry
    @song = Song.find(params[:id])
    @song.update(song_params)
    if  @song.save 
      redirect_to song_path(@song)
    else
      render :edit 
    end 
  end 

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    #@songs = Song.all
    redirect_to songs_path
  end 

  private 

  def song_params
    params[:song].permit(:title, :released, :release_year, :artist_name,:genre)
  end

end




