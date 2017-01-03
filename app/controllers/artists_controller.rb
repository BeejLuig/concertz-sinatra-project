class ArtistsController < ApplicationController
  get '/artists' do
    erb :'/artists/artists'
  end

  post '/artists' do
    @artist = current_user.artists.create(name: params[:name], bio: params[:bio])
    if @artist.valid?
      redirect to "/artists/#{@artist.slug}"
    else
      redirect to '/artists/new'
    end
  end

  get '/artists/new' do
    if logged_in?
      erb :'/artists/create_artist'
    else
      redirect to '/'
    end
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show_artist'
  end

  get '/artists/:slug/edit' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/edit_artist'
  end
end
