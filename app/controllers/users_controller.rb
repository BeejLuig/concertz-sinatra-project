class UsersController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect to "/users/#{current_user.id}"
    else
      erb :'/users/create_user'
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/users/#{current_user.id}"
    else
      erb :'/users/login_user'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user.valid?
     session[:user_id] = @user.id
     redirect to '/'
    else
     redirect to '/login'
    end
  end

  post '/signup' do
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
