class CamerasController < ApplicationController

  get "/cameras" do
    erb :"/cameras/index"
  end

  get "/cameras/new" do
    erb :"/cameras/new"
  end

  post "/cameras" do
    redirect "/cameras"
  end

  get "/cameras/:id" do
    erb :"/cameras/show"
  end

  get "/cameras/:id/edit" do
    erb :"/cameras/edit"
  end

  patch "/cameras/:id" do
    redirect "/cameras/:id"
  end

  delete "/cameras/:id/delete" do
    redirect "/cameras"
  end
  
end
