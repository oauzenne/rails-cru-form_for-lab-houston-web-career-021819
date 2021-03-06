class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
    @artists = Artist.all
  end

  def update
    @artist = Artist.find(params[:id])
	  @artist.update(artist_params[:artist])
	  redirect_to artist_path(@artist)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params[:artist])
    @artist.save
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to '/artists'
  end

  def artist_params
    request_params = params
    params.permit(artist: [:name, :bio])
  end












end
