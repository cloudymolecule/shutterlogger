class PhotosController < ApplicationController

  get "/photos" do
    @photos = current_user.photos
    erb :"/photos/index"
  end

  get "/photos/new" do
    erb :"/photos/new"
  end

  post "/photos" do
    redirect to "/photos"
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
