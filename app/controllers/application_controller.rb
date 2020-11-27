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
      if !logged_in? 
        flash[:message] = "Please log in to access site!"
        redirect to '/login'
      end
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

    def created_date_time(var) #working currently

      date_time = var.created_at.localtime.to_a
      date_time.pop
      date_time.pop
      date_time.pop
      date_time.pop
      date_time = date_time.reverse
      
      month = date_time[1]
      day = date_time[2]
      year = date_time[0].to_s
      
      hour = date_time[3].to_s
      minutes = date_time[4].to_s
      seconds = date_time[5].to_s

      case month
        when 1
          month = "January"
        when 2
          month = "February"
        when 3
          month = "March"
        when 4
          month = "April"
        when 5
          month = "May"
        when 6
          month = "June"
        when 7
          month = "July"
        when 8
          month = "August"
        when 9
          month = "September"
        when 10
          month = "October"
        when 11
          month = "Nov"
        when 12
          month = "December"
      end

      case day
        when 1
          day = "1st"
        when 2
          day = "2nd"
        when 3
          day = "3rd"
        when 4..31
          day = day.to_s + "th"
      end
      string = "Added on: #{month} #{day}, #{year} at #{hour}:#{minutes}:#{seconds}"
      result = [string, var]
    end

    def edited_date_time

    end

  end

end
