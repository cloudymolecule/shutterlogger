class UsersController < ApplicationController

  
  get "/users" do
    erb :"/users/index"
  end

  get "/users/new" do
    erb :"/users/new"
  end

  post "/signup" do
    user = User.new(params[:user])
    if user.save && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    else
      @errors = user.errors.full_messages
      erb :"/users/signup"
    end
  end

  post "/login" do
    !params[:user][:username].blank? ? user = User.find_by(username: params[:user][:username]) : user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    end
  end

  post "/users" do
    redirect to "/users"
  end

  get "/users/:id" do
    erb :"/users/show"
  end

  get "/users/:id/edit" do
    erb :"/users/edit"
  end

  patch "/users/:id" do
    redirect to "/users/:id"
  end

  delete "/users/:id/delete" do
    redirect to "/users"
  end

end
