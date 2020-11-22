class RollsController < ApplicationController

  get "/rolls" do
    erb :"/rolls/index.html"
  end

  get "/rolls/new" do
    erb :"/rolls/new.html"
  end

  post "/rolls" do
    redirect "/rolls"
  end

  get "/rolls/:id" do
    erb :"/rolls/show.html"
  end

  get "/rolls/:id/edit" do
    erb :"/rolls/edit.html"
  end

  patch "/rolls/:id" do
    redirect "/rolls/:id"
  end

  delete "/rolls/:id/delete" do
    redirect "/rolls"
  end

end
