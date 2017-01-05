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
    if !@user.nil?
     session[:user_id] = @user.id
     redirect to '/'
    else
     redirect to '/login'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      redirect to '/signup'
    end
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if logged_in? && @user == current_user
      erb :'/users/show_user'
    else
      redirect to '/login'
    end
  end

  get '/users/:id/edit' do
    @user = User.find_by_id(params[:id])
    if logged_in? && @user == current_user
      erb :'/users/edit_user'
    else
      redirect to '/login'
    end
  end

  patch '/users/:id' do
    @user = User.find_by_id(params[:id])
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    if logged_in? && @user == current_user && @user.valid?
      @user.save
      redirect to "/users/#{@user.id}"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
   if logged_in?
     session.clear
     redirect to '/'
   else
     redirect to '/'
   end
 end
end
