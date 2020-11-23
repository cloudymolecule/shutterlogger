require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
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

    def loaded
      if @camera.loaded == 1
        return "The camera is currently LOADED with film."
      else
        return "The camera is currently UNLOADED with film."
      end
    end
    
  end

end
