class LensController < ApplicationController

  get "/lens" do
    redirect_if_not_logged_in
    @lens = current_user.lens
    erb :"/lens/index"
  end
  
  get "/lens/new" do
    redirect_if_not_logged_in
    if current_user.cameras.count == 0
      flash[:message] = "Please add a Camera before adding a Lens"
      redirect to "/users/show"
    else
      erb :"/lens/new"
    end
  end

  post "/lens" do
    len = Len.new(
      make: params[:len][:make],
      model: params[:len][:model],
      focal_range: params[:len][:focal_range],
      min_aperture: params[:len][:min_aperture],
      max_aperture: params[:len][:max_aperture],
      camera_id: params[:len][:camera_id],
      user_id: params[:len][:user_id],
      created_at: Time.now,
      updated_at: Time.now
    )
    if len.save
      redirect to "/lens/#{len.id}"
    else
      @errors = len.errors.full_messages
      erb :"/lens/new"
    end

  end

  get "/lens/:id" do
    redirect_if_not_logged_in
    if @len = Len.find_by(id: params[:id])
      if @len.user_id == session[:user_id]
        erb :"/lens/show"
      else
        not_authorized
      end
    else
      redirect to "/lens"
    end
  end

  get "/lens/:id/edit" do
    redirect_if_not_logged_in
    @len = Len.find_by(id: params[:id])
    if @len.user_id == session[:user_id]
      erb :"/lens/edit"
    else
      not_authorized
    end
  end

  patch "/lens/:id" do
    len = Len.find_by(id: params[:id])
    len.update(
      make: params[:len][:make],
      model: params[:len][:model],
      focal_range: params[:len][:focal_range],
      min_aperture: params[:len][:min_aperture],
      max_aperture: params[:len][:max_aperture],
      camera_id: params[:len][:camera_id],
      user_id: params[:len][:user_id],
      updated_at: Time.now
    )
    if len.save
      redirect to "/lens/#{len.id}"
    else
      @errors = len.errors.full_messages
      @len = len
      erb :"/lens/edit"
    end
  end

  delete "/lens/:id" do
    len = Len.find_by(id: params[:id])
    flash[:message] = "#{len.make} - #{len.model} | deleted successfully."
    len.destroy
    redirect to "/lens"
  end
  
end
