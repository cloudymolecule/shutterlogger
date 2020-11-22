class LensesController < ApplicationController


  get "/lenses" do
    erb :"/lenses/index.html"
  end
  
  get "/lenses/new" do
    erb :"/lenses/new.html"
  end

  post "/lenses" do
    redirect "/lenses"
  end

  get "/lenses/:id" do
    erb :"/lenses/show.html"
  end

  get "/lenses/:id/edit" do
    erb :"/lenses/edit.html"
  end

  patch "/lenses/:id" do
    redirect "/lenses/:id"
  end

  delete "/lenses/:id/delete" do
    redirect "/lenses"
  end
  
end
