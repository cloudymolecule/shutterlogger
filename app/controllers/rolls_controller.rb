class RollsController < ApplicationController

  get "/rolls" do
    erb :"/rolls/index"
  end

  get "/rolls/new" do
    erb :"/rolls/new"
  end

  post "/rolls" do
    redirect to "/rolls"
  end

  get "/rolls/:id" do
    erb :"/rolls/show"
  end

  get "/rolls/:id/edit" do
    erb :"/rolls/edit"
  end

  patch "/rolls/:id" do
    redirect to "/rolls/:id"
  end

  delete "/rolls/:id/delete" do
    redirect to "/rolls"
  end

end
