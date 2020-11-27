class CamerasController < ApplicationController

  get "/cameras" do
    @cameras = current_user.cameras
    erb :"/cameras/index"
  end

  get "/cameras/new" do
    if logged_in?
      erb :"/cameras/new"
    else
      redirect to "/login"
    end
    
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
    @camera = Camera.find_by(id: params[:id])
    erb :"/cameras/show"
  end

  get "/cameras/:id/edit" do
    @camera = Camera.find_by(id: params[:id])
    erb :"/cameras/edit"
  end

  patch "/cameras/:id" do
    camera = Camera.find_by(id: params[:id])
    camera.update(
      nickname: params[:camera][:nickname],
      make: params[:camera][:make],
      model: params[:camera][:model],
      user_id: params[:camera][:user_id],
      updated_at: Time.now
    )
    if camera.save
      redirect to "/cameras/#{camera.id}"
    else
      @errors = camera.errors.full_messages
      @camera = camera
      erb :"/cameras/edit"
    end
  end

  delete "/cameras/:id" do
    camera = Camera.find_by(id: params[:id])
    flash[:message] = "#{camera.make} - #{camera.model} | deleted successfully."
    camera.destroy
    redirect to "/cameras"
  end
  
end
