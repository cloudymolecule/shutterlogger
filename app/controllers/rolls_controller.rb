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
    if @roll = Roll.find_by(id: params[:id])
      erb :"/rolls/show"
    else
      redirect to "/rolls"
    end
  end

  get "/rolls/:id/edit" do
    @roll = Roll.find_by(id: params[:id])
    erb :"/rolls/edit"
  end

  patch "/rolls/:id" do
    roll = Roll.find_by(id: params[:id])
    roll.update(
      exp_count: params[:roll][:exp_count],
      brand: params[:roll][:brand],
      iso: params[:roll][:iso],
      comments: params[:roll][:comments],
      camera_id: params[:roll][:camera_id],
      user_id: params[:roll][:user_id],
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
      @errors = roll.errors.full_messages
      @roll = roll
      erb :"/rolls/edit"
    end
  end

  delete "/rolls/:id/delete" do
    roll = Roll.find_by(id: params[:id])
    flash[:message] = "#{roll.brand} - #{roll.comments} | deleted successfully."
    roll.destroy
    redirect to "/rolls"
  end

end
