class ConcertsController < ApplicationController

  get '/concerts/new' do
    if logged_in?
      erb :'/concerts/create_concert'
    else
      redirect to '/'
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
