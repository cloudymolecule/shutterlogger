class CameraPhotosController < ApplicationController

  get "/camera_photos" do
    erb :"/camera_photos/index.html"
  end

  get "/camera_photos/new" do
    erb :"/camera_photos/new.html"
  end

  post "/camera_photos" do
    redirect "/camera_photos"
  end

  get "/camera_photos/:id" do
    erb :"/camera_photos/show.html"
  end

  get "/camera_photos/:id/edit" do
    erb :"/camera_photos/edit.html"
  end

  patch "/camera_photos/:id" do
    redirect "/camera_photos/:id"
  end

  delete "/camera_photos/:id/delete" do
    redirect "/camera_photos"
  end

end
