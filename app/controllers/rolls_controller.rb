class RollsController < ApplicationController

  get "/rolls" do
    @rolls = current_user.rolls
    erb :"/rolls/index"
  end

  get "/rolls/new" do
    erb :"/rolls/new"
  end

  post "/rolls" do
    roll = Roll.new(
      exp_count: params[:roll][:exp_count],
      brand: params[:roll][:brand],
      iso: params[:roll][:iso],
      comments: params[:roll][:comments],
      camera_id: params[:roll][:camera_id],
      user_id: params[:roll][:user_id],
      created_at: Time.now,
      updated_at: Time.now
    )

    if roll.save
      camera = Camera.find_by(id: params[:roll][:camera_id])
      camera.loaded = 1
      camera.save
      redirect to "/rolls/#{roll.id}"
    else
      @errors = []
      error = roll.errors.full_messages
      error.each do |e|
        if e == "Camera can't be blank"
          e = "You must select a Camera"
        end
        @errors << e
      end
      erb :"/rolls/new"
    end
  end

  get "/rolls/:id" do
    @roll = Roll.find_by(id: params[:id])
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
