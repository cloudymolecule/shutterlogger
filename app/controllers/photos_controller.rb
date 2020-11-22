class PhotosController < ApplicationController

  get "/photos" do
    erb :"/photos/index.html"
  end

  get "/photos/new" do
    erb :"/photos/new.html"
  end

  post "/photos" do
    redirect "/photos"
  end

  get "/photos/:id" do
    erb :"/photos/show.html"
  end

  get "/phot_os/:id/edit" do
    erb :"/photos/edit.html"
  end

  patch "/photos/:id" do
    redirect "/photos/:id"
  end

  delete "/photos/:id/delete" do
    redirect "/photos"
  end

end
