class PhotosController < ApplicationController

  get "/photos" do
    @photos = current_user.photos
    erb :"/photos/index"
  end

  get "/photos/new" do
    erb :"/photos/new"
  end

  post "/photos" do
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
      redirect to "/photos/#{photo.id}"
    else
      @errors = []
      error = photo.errors.full_messages
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
      erb :"/photos/new"
    end
  end

  get "/photos/:id" do
    @photo = Photo.find_by(id: params[:id])
    erb :"/photos/show"
  end

  get "/phot_os/:id/edit" do
    erb :"/photos/edit"
  end

  patch "/photos/:id" do
    redirect to "/photos/:id"
  end

  delete "/photos/:id/delete" do
    redirect to "/photos"
  end

end
