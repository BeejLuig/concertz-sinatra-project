class ConcertsController < ApplicationController
  get '/concerts/:id' do
    @concert = Concert.find_by(id: params[:id])
    erb :'/concerts/show_concert'
  end

  get '/concerts/:id/edit' do
    @concert = Concert.find_by(id: params[:id])
    erb :'/concerts/edit_concert'
  end
end
