class LensController < ApplicationController


  get "/lens" do
    @lens = current_user.lens
    erb :"/lens/index"
  end
  
  get "/lens/new" do
    erb :"/lens/new"
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
    @len = Len.find_by(id: params[:id])
    erb :"/lens/show"
  end

  get "/lens/:id/edit" do
    @len = Len.find_by(id: params[:id])
    erb :"/lens/edit"
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

  delete "/lens/:id/delete" do
    redirect to "/lens"
  end
  
end
