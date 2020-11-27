require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
    set :method_override, true
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :"/users/signup"
  end

  get "/login" do
    erb :"/users/login"
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      flash[:message] = "Please log in to access site!"
      redirect to '/login' if !logged_in?
    end

    def not_authorized
      flash[:message] = "Forbidden, can't access content!"
      redirect to "/users/show"
    end

    def loaded
      if @camera.loaded == true
        return "The camera is currently LOADED with film."
      else
        return "The camera is currently UNLOADED with film."
      end
    end

  end

end
