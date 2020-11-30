class CamerasController < ApplicationController

  get "/cameras" do
    redirect_if_not_logged_in
    @cameras = current_user.cameras
    erb :"/cameras/index"
  end

  get "/cameras/new" do
    redirect_if_not_logged_in
    erb :"/cameras/new"
  end

  post "/cameras" do
    camera = Camera.new(
      nickname: params[:camera][:nickname],
      make: params[:camera][:make],
      model: params[:camera][:model],
      loaded: 0,
      user_id: params[:camera][:user_id],
      created_at: Time.now,
      updated_at: Time.now
    )
    if camera.save
      redirect to "/cameras/#{camera.id}"
    else
      @errors = camera.errors.full_messages
      erb :"/cameras/new"
    end
  end

  get "/cameras/:id" do
    redirect_if_not_logged_in
    if @camera = Camera.find_by(id: params[:id])
      if @camera.user_id == session[:user_id]
        erb :"/cameras/show"
      else
        not_authorized
      end
    else
      redirect to "/cameras"
    end
  end

  get "/cameras/:id/edit" do
    redirect_if_not_logged_in
    @camera = Camera.find_by(id: params[:id])
    if @camera.user_id == session[:user_id]
      erb :"/cameras/edit"
    else
      not_authorized
    end
  end

  patch "/cameras/:id" do
    @camera = Camera.find_by(id: params[:id])
    @camera.update(
      nickname: params[:camera][:nickname],
      make: params[:camera][:make],
      model: params[:camera][:model],
      user_id: params[:camera][:user_id],
      updated_at: Time.now
    )
    if @camera.save
      redirect to "/cameras/#{@camera.id}"
    else
      @errors = @camera.errors.full_messages
      erb :"/cameras/edit"
    end
  end

  delete "/cameras/:id" do
    camera = Camera.find_by(id: params[:id])
    flash[:message] = "#{camera.make} - #{camera.model} deleted successfully."
    camera.destroy
    redirect to "/cameras"
  end
  
  get "/cameras/:id/unload" do
    redirect_if_not_logged_in
    if @camera = Camera.find_by(id: params[:id])
      if @camera.user_id == session[:user_id]
        if @camera.loaded == true
          rolls = @camera.rolls
          current_roll = nil
          rolls.each do |r|
            if r.exp_count != 0
              current_roll = r 
            end
          end
          current_roll.exp_count = 0
          current_roll.save
          @camera.loaded = 0
          @camera.save
          flash[:camera] = "Camera successfully unloaded"
          redirect to "/cameras/#{@camera.id}"
        end
        flash[:camera] = "Camera already unloaded"
        redirect to "/cameras/#{@camera.id}"
      else
        not_authorized
      end
    end
  end

end
