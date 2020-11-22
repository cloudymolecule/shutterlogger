class CamerasController < ApplicationController

  get "/cameras" do
    erb :"/cameras/index.html"
  end

  get "/cameras/new" do
    erb :"/cameras/new.html"
  end

  post "/cameras" do
    redirect "/cameras"
  end

  get "/cameras/:id" do
    erb :"/cameras/show.html"
  end

  get "/cameras/:id/edit" do
    erb :"/cameras/edit.html"
  end

  patch "/cameras/:id" do
    redirect "/cameras/:id"
  end

  delete "/cameras/:id/delete" do
    redirect "/cameras"
  end
  
end
