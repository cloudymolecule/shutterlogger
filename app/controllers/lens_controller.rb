class LensController < ApplicationController


  get "/lens" do
    erb :"/lens/index.html"
  end
  
  get "/lens/new" do
    erb :"/lens/new.html"
  end

  post "/lens" do
    redirect "/lens"
  end

  get "/lens/:id" do
    erb :"/lens/show.html"
  end

  get "/lens/:id/edit" do
    erb :"/lens/edit.html"
  end

  patch "/lens/:id" do
    redirect "/lens/:id"
  end

  delete "/lens/:id/delete" do
    redirect "/lens"
  end
  
end
