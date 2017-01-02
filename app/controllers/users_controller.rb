class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/create_user'
  end

  get '/login' do
    erb :'/users/login_user'
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show_user'
  end

  get '/users/:id/edit' do
    @user = User.find_by(id: params[:id])
    erb :'/users/edit_user'
  end
end
