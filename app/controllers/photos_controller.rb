class PhotosController < ApplicationController

  get "/photos" do
    erb :"/photos/index"
  end

  get "/photos/new" do
    erb :"/photos/new"
  end

  post "/photos" do
    redirect "/photos"
  end

  get "/photos/:id" do
    erb :"/photos/show"
  end

  get "/phot_os/:id/edit" do
    erb :"/photos/edit"
  end

  patch "/photos/:id" do
    redirect "/photos/:id"
  end

  delete "/photos/:id/delete" do
    redirect "/photos"
  end

end
