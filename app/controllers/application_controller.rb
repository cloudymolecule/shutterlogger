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

  not_found do
    flash[:message] = "Incorrect URL"
    redirect to "/home"
  end

  get "/" do
    if logged_in?
      redirect to "/users/#{current_user.id}"
    else
      erb :index
    end
  end

  get "/home" do
    redirect_if_not_logged_in
    erb :"/users/show"
  end

  get "/signup" do
    if logged_in?
      erb :"users/show"
    else
      erb :"/users/signup"
    end
  end

  get "/login" do
    if logged_in?
      erb :"users/show"
    else
      erb :"/users/login"
    end
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
      redirect to "/home"
    end

    def loaded
      if @camera.loaded == true
        return "The camera is currently LOADED with film."
      else
        return "The camera is currently UNLOADED with film."
      end
    end

    def created_date_time(var)

      date_time = var.created_at.localtime.to_a
      date_time.pop
      date_time.pop
      date_time.pop
      date_time.pop
      date_time = date_time.reverse
      
      month = month_conversion(date_time[1])
      day = day_conversion(date_time[2])
      year = date_time[0].to_s
      
      hour = date_time[3]
      minutes = date_time[4]
      seconds = date_time[5]

      string = "Added on: #{month} #{day}, #{year} at #{hour}:#{minutes}:#{seconds}"
      result = [string, month, day, year, hour, minutes, seconds]
    end

    def updated_date_time(var)
      created = created_date_time(var)

      date_time = var.updated_at.localtime.to_a
      date_time.pop
      date_time.pop
      date_time.pop
      date_time.pop
      date_time = date_time.reverse
      
      month = month_conversion(date_time[1])
      day = day_conversion(date_time[2])
      year = date_time[0].to_s
      
      hour = date_time[3]
      minutes = date_time[4]
      seconds = date_time[5]
      
      string = "Edited on: #{month} #{day}, #{year} at #{hour}:#{minutes}:#{seconds}"
      result = [string, month, day, year, hour, minutes, seconds]
      if created[1] == result[1] && created[2] == result[2] && created[3] == result[3] && created[4] == result[4] && created[5] == result[5] && created[6] == result[6]
        final = "Edited on: No edits yet" 
      else
        final = string
      end
      final
    end

  end

  def day_conversion(day)
    case day
      when 1
        day = "1st"
      when 2
        day = "2nd"
      when 3
        day = "3rd"
      when 31
        day = "31st"
      when 4..30
        day = day.to_s + "th"
    end
  end

  def month_conversion(month)
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
        month = "November"
      when 12
        month = "December"
    end
  end

end
