class UsersController < ApplicationController

  post "/signup" do
    user = User.new(params[:user])
    user.created_at = Time.now
    user.updated_at = Time.now
    if user.save
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    else
      @errors = user.errors.full_messages
      erb :"/users/signup"
    end
  end

  post "/login" do
    if !logged_in?
      !params[:user][:username].blank? ? user = User.find_by(username: params[:user][:username]) : user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
      else
        flash[:message] = "Incorrect, please try again."
        redirect to "/login"
      end
    else
      @user = User.find_by(id: params[:id])
      erb :"/users/show"
    end
  end

  get "/logout" do
    redirect_if_not_logged_in
    session.clear
    redirect to "/login"
  end

  get "/users/:id" do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    if @user.id == session[:user_id]
      erb :"/users/show"
    else
      not_authorized
    end
  end

  get "/users/:id/edit" do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    if @user.id == session[:user_id]
      erb :"/users/edit"
    else
      not_authorized
    end
  end

  patch "/users/:id" do
    user = User.find_by(id: params[:id])
    user.updated_at = Time.now
    user.update(params[:user])
    if user.save
      session.clear
      flash[:message] = "Account updated successfully."
      redirect to "/login"
    else
      @errors = user.errors.full_messages
      erb :"/users/edit"
    end
  end

  delete "/users/:id" do
    redirect_if_not_logged_in
    session.clear
    user = User.find_by(id: params[:id])
    flash[:message] = "Account deleted successfully."
    user.destroy
    redirect to "/signup"
  end

end
