class ConcertsController < ApplicationController

  get '/concerts/new' do
    if logged_in?
      erb :'/concerts/create_concert'
    else
      redirect to '/'
    end
  end

  post '/concerts' do
    @concert = Concert.create(artist: Artist.find_or_create_by(name: params[:artist][:name], user_id: current_user.id),
                              location: params[:location],
                              concert_date: Date.parse(params[:concert_date]),
                              description: params[:description],
                              ticket_price: params[:ticket_price])
    if @concert.valid?
      redirect to "/concerts/#{@concert.id}"
    else
      redirect to '/concerts/new'
    end
  end

  get '/concerts/:id' do
    @concert = Concert.find_by(id: params[:id])
    erb :'/concerts/show_concert'
  end

  get '/concerts/:id/edit' do
    @concert = Concert.find_by(id: params[:id])
    erb :'/concerts/edit_concert'
  end
end
