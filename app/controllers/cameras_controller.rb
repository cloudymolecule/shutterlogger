class CamerasController < ApplicationController

  get "/cameras" do
    redirect_if_not_logged_in
    @cameras = current_user.cameras
    erb :"/cameras/index"
  end

  get "/cameras/new" do
    redirect_if_not_logged_in
    # if logged_in?
    #   erb :"/cameras/new"
    # else
    #   redirect to "/login"
    # end
    
  end

  post "/cameras" do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @camera = Camera.find_by(id: params[:id])
    if @camera.user_id == session[:user_id]
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
        @errors = camera.errors.full_messages
        erb :"/cameras/edit"
      end
    else
      not_authorized
    end
  end

  delete "/cameras/:id" do
    redirect_if_not_logged_in
    @camera = Camera.find_by(id: params[:id])
    if @camera.user_id == session[:user_id]
      flash[:message] = "#{@camera.make} - #{@camera.model} | deleted successfully."
      @camera.destroy
      redirect to "/cameras"
    else
      not_authorized
    end
  end
  
end
