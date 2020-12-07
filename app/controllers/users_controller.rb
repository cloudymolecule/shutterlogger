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
    if session[:user_id] != params[:id].to_i
      not_authorized
    else
      @user = User.find_by(id: params[:id])
      erb :"/users/show"
    end
  end

  get "/users/:id/edit" do
    redirect_if_not_logged_in
    if session[:user_id] != params[:id].to_i
      not_authorized
    else
      @user = User.find_by(id: params[:id])
      erb :"/users/edit"
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
    user = User.find_by(id: params[:id])

    rolls = Roll.all
    cameras = Camera.all
    photos = Photo.all
    lens = Len.all 
    
    rolls.each do |roll|
      if roll.user_id == user.id
      roll.destroy
      end
    end
  
    cameras.each do |camera|
      if camera.user_id == user.id
        camera.destroy
      end
    end
  
    photos.each do |photo|
      if photo.user_id == user.id
        photo.destroy
      end
    end
  
    lens.each do |len|
      if len.user_id == user.id
        len.destroy
      end
    end

    session.clear
    user.destroy
    flash[:message] = "Account deleted successfully."

    redirect to "/signup"

  end

end
