class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    Artist.create(artist_params)
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
  end

  private

  def artist_params

  end
end
