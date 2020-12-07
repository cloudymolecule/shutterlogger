class RollsController < ApplicationController

  get "/rolls" do
    redirect_if_not_logged_in
    @rolls = current_user.rolls
    erb :"/rolls/index"
  end

  get "/rolls/new" do
    redirect_if_not_logged_in
    if current_user.cameras.count == 0 || current_user.lens.count == 0
      flash[:message] = "Please add a Camera and a Lens before adding a Film Roll"
      redirect to "/home"
    else
      cams = current_user.cameras
      @cameras = []
      cams.each do |c|
      if c.loaded == false
        @cameras << c
      end
    end
    erb :"/rolls/new"
    end
  end

  post "/rolls" do
    redirect_if_not_logged_in
    if roll = Roll.new(
      exp_count: params[:roll][:exp_count],
      brand: params[:roll][:brand],
      iso: params[:roll][:iso],
      comments: params[:roll][:comments],
      camera_id: params[:roll][:camera_id],
      user_id: params[:roll][:user_id],
      created_at: Time.now,
      updated_at: Time.now
    )
      if roll.save
        camera = Camera.find_by(id: params[:roll][:camera_id])
        camera.loaded = 1
        camera.save
        redirect to "/rolls/#{roll.id}"
      else
        @errors = []
        error = roll.errors.full_messages
        error.each do |e|
          if e == "Camera can't be blank"
            e = "You must select a Camera"
          end
          cams = current_user.cameras
          @cameras = []
          cams.each do |c|
            if c.loaded == false
              @cameras << c
            end
          end
          @errors << e
        end
        erb :"/rolls/new"
      end
    else
      not_authorized
    end
  end

  get "/rolls/:id/photos" do
    redirect_if_not_logged_in
    if roll = Roll.find_by(id: params[:id])
      if roll.user_id == session[:user_id]
        @photos = roll.photos
        if @photos != [] && @photos[0] != nil
          erb :"/rolls/photo_list"
        else
          @rolls = current_user.rolls
          flash[:message] = "No photos to show"
          redirect to "/rolls"
        end
      else
        not_authorized
      end
    else
      not_authorized
    end
  end

  get "/rolls/:id" do
    redirect_if_not_logged_in
    if @roll = Roll.find_by(id: params[:id])
      if @roll.user_id == session[:user_id]
        erb :"/rolls/show"
      else
        not_authorized
      end
    else
      not_authorized
    end
  end

  get "/rolls/:id/edit" do
    redirect_if_not_logged_in
    if @roll = Roll.find_by(id: params[:id])
      if @roll.user_id == session[:user_id]
        erb :"/rolls/edit"
      else
        not_authorized
      end
    else
      not_authorized
    end
  end

  patch "/rolls/:id" do
    redirect_if_not_logged_in
    if roll = Roll.find_by(id: params[:id])
      roll.update(
        exp_count: params[:roll][:exp_count],
        brand: params[:roll][:brand],
        iso: params[:roll][:iso],
        comments: params[:roll][:comments],
        camera_id: params[:roll][:camera_id],
        user_id: params[:roll][:user_id],
        updated_at: Time.now
      )

      if roll.save
        camera = Camera.find_by(id: params[:roll][:camera_id])
        camera.loaded = 1
        camera.save
        redirect to "/rolls/#{roll.id}"
      else
        @errors = []
        error = roll.errors.full_messages
        error.each do |e|
          if e == "Camera can't be blank"
            e = "You must select a Camera"
          end
          @errors << e
        end
        @errors = roll.errors.full_messages
        @roll = roll
        erb :"/rolls/edit"
      end
    else
      not_authorized
    end
  end

  delete "/rolls/:id" do
    redirect_if_not_logged_in
    if roll = Roll.find_by(id: params[:id])
      flash[:message] = "#{roll.brand} / ISO #{roll.iso} deleted successfully."
      if camera = Camera.find_by(id: roll.camera_id)
        camera
        camera.update(loaded: 0)
        camera.save
      end
      roll.photos.each do |p|
        p.destroy
      end
      roll.destroy
      redirect to "/rolls"
    else
      not_authorized
    end
  end

end
