class LensController < ApplicationController


  get "/lens" do
    erb :"/lens/index"
  end
  
  get "/lens/new" do
    erb :"/lens/new"
  end

  post "/lens" do
    redirect "/lens"
  end

  get "/lens/:id" do
    erb :"/lens/show"
  end

  get "/lens/:id/edit" do
    erb :"/lens/edit"
  end

  patch "/lens/:id" do
    redirect "/lens/:id"
  end

  delete "/lens/:id/delete" do
    redirect "/lens"
  end
  
end
