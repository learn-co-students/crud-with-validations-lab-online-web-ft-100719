class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else 
      render :edit
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
