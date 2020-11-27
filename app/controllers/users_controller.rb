class UsersController < ApplicationController

  
  get "/users" do
    erb :"/users/index"
  end

  post "/signup" do
    user = User.new(params[:user])
    if user.save
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
    else
      flash[:message] = "Incorrect, please try again."
      redirect to "/login"
    end
  end

  get "/logout" do
    redirect_if_not_logged_in
    session.clear
    redirect to "/login"
  end

  # post "/users" do
  #   redirect_if_not_logged_in
  #   redirect to "/users"
  # end

  get "/users/:id" do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    erb :"/users/show"
  end

  get "/users/:id/edit" do
    redirect_if_not_logged_in
    erb :"/users/edit"
  end

  patch "/users/:id" do
    redirect_if_not_logged_in
    redirect to "/users/:id"
  end

  delete "/users/:id/delete" do
    redirect_if_not_logged_in
    redirect to "/users"
  end

end
