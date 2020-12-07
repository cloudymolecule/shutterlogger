class PhotosController < ApplicationController

  get "/photos" do
    redirect_if_not_logged_in
    @photos = current_user.photos
    erb :"/photos/index"
  end

  get "/photos/new" do
    redirect_if_not_logged_in
    if current_user.rolls.count == 0 || current_user.cameras.count == 0 || current_user.lens.count == 0
      flash[:message] = "Please add a Camera, a Lens and Film Roll before adding a photo"
      redirect to "/home"
    else
      rollz = current_user.rolls
      @rolls = []
      rollz.each do |r|
        if r.exp_count != 0
          @rolls << r
        end
      end

      cams = current_user.cameras
      @cameras = []
      cams.each do |c|
        if c.loaded == true
          @cameras << c
        end
      end
      erb :"/photos/new"
    end
  end

  post "/photos" do
    redirect_if_not_logged_in
    params[:photo][:description] = params[:photo][:description].gsub(/[[:space:]]+/, ' ').strip
    
    if params[:photo][:description] == ""
      params[:photo][:description] = "No description"
    end

    if params[:photo][:shutter] == ""
      params[:photo][:shutter] = "No info"
    end

    if params[:photo][:aperture] == ""
      params[:photo][:aperture] = "No info"
    end

    if params[:photo][:focal_length] == ""
      params[:photo][:focal_length] = "No info"
    end

    if params[:photo][:date] == ""
      params[:photo][:date] = "Unknown"
    end

    if params[:photo][:time] == ""
      params[:photo][:time] = "Unknown"
    end

    if params[:photo][:location] == ""
      params[:photo][:location] = "Unknown"
    end

    photo = Photo.new(
        name: params[:photo][:name],
        description: params[:photo][:description],
        shutter: params[:photo][:shutter],
        aperture: params[:photo][:aperture],
        focal_length: params[:photo][:focal_length],
        date: params[:photo][:date],
        time: params[:photo][:time],
        location: params[:photo][:location],
        rating: params[:photo][:rating],
        roll_id: params[:photo][:roll_id],
        len_id: params[:photo][:len_id],
        camera_id: params[:photo][:camera_id],
        user_id: params[:photo][:user_id],
        created_at: Time.now,
        updated_at: Time.now
      )

    

    if photo.save
      if params[:photo][:roll_id]
        roll = Roll.find_by(id: params[:photo][:roll_id]) 
        roll.update(exp_count: (roll.exp_count -= 1))
        roll.save
        if roll.exp_count == 0
          cam = Camera.find_by(id: roll.camera.id)
          cam.update(loaded: 0)
          flash[:message] = "Film Roll spent. #{cam.make} unloaded"
        end
      end
      redirect to "/photos/#{photo.id}"
    else
      @errors = []
      error = photo.errors.full_messages
      error.each do |e|
        
        if e == "Camera can't be blank"
          e = "You must select a Camera (if none available, please add one first)"
        end
        if e == "Len can't be blank"
          e = "You must select a Lens (if none available, please add one first)"
        end
        if e == "Roll can't be blank"
          e = "You must select a Roll (if none available, please add one first)"
        end
        @errors << e
      end
      rollz = current_user.rolls
      @rolls = []
      rollz.each do |r|
        if r.exp_count != 0
          @rolls << r
        end
      end

      cams = current_user.cameras
      @cameras = []
      cams.each do |c|
        if c.loaded == true
          @cameras << c
        end
      end
      erb :"/photos/new"
    end
  end
  

  get "/photos/:id" do
    redirect_if_not_logged_in
    if @photo = Photo.find_by(id: params[:id])
      if @photo.user_id == session[:user_id]
        erb :"/photos/show"
      else
        not_authorized
      end
    else
      not_authorized
    end
  end

  get "/cameras/:id/photos" do
    redirect_if_not_logged_in
    if camera = Camera.find_by(id: params[:id])
      if camera.user_id == session[:user_id]
        @photos = camera.photos
        if @photos != [] && @photos[0] != nil
          erb :"/cameras/photo_list"
        else
          flash[:message] = "No photos to show"
          redirect to "/cameras/index"
        end
      else
        not_authorized
      end
    else
      not_authorized
    end
  end

  get "/photos/:id/edit" do
    redirect_if_not_logged_in
    if @photo = Photo.find_by(id: params[:id])
      if @photo.user_id == session[:user_id]
        erb :"/photos/edit"
      else
        not_authorized
      end
    else
      not_authorized
    end
  end

  patch "/photos/:id" do
    redirect_if_not_logged_in
    if @photo = Photo.find_by(id: params[:id])
      params[:photo][:description] = params[:photo][:description].gsub(/[[:space:]]+/, ' ').strip
      if params[:photo][:description] == ""
        params[:photo][:description] = "No description"
      end

      if params[:photo][:shutter] == ""
        params[:photo][:shutter] = "No info"
      end

      if params[:photo][:aperture] == ""
        params[:photo][:aperture] = "No info"
      end

      if params[:photo][:focal_length] == ""
        params[:photo][:focal_length] = "No info"
      end

      if params[:photo][:date] == ""
        params[:photo][:date] = "Unknown"
      end

      if params[:photo][:time] == ""
        params[:photo][:time] = "Unknown"
      end

      if params[:photo][:location] == ""
        params[:photo][:location] = "Unknown"
      end

      @photo.update(
          name: params[:photo][:name],
          description: params[:photo][:description],
          shutter: params[:photo][:shutter],
          aperture: params[:photo][:aperture],
          focal_length: params[:photo][:focal_length],
          date: params[:photo][:date],
          time: params[:photo][:time],
          location: params[:photo][:location],
          rating: params[:photo][:rating],
          roll_id: params[:photo][:roll_id],
          len_id: params[:photo][:len_id],
          camera_id: params[:photo][:camera_id],
          user_id: params[:photo][:user_id],
          updated_at: Time.now
        )
        
      if @photo.save
        redirect to "/photos/#{@photo.id}"
      else
        @errors = []
        error = @photo.errors.full_messages
        error.each do |e|
          
          if e == "Camera can't be blank"
            e = "You must select a Camera"
          end
          if e == "Len can't be blank"
            e = "You must select a Lens"
          end
          if e == "Roll can't be blank"
            e = "You must select a Roll"
          end
          @errors << e
        end
        erb :"/photos/edit"
      end
    else
      not_authorized
    end
  end

  delete "/photos/:id" do
    redirect_if_not_logged_in
    if photo = Photo.find_by(id: params[:id])
      flash[:message] = "'#{photo.name}' deleted successfully."
      photo.destroy
      redirect to "/photos"
    else
      not_authorized
    end
  end

end
