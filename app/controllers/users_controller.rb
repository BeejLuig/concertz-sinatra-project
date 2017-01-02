class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/create_user'
  end

  get '/login' do
    erb :'/users/login_user'
  end

  post '/users' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if @user.valid?
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      redirect to '/signup'
    end
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
