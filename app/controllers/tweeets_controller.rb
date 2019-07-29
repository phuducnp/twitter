class TweeetsController < ApplicationController
  before_action :authenticate_user!, except: %i(index show)
  skip_before_action :verify_authenticity_token, only: :destroy
  include Set_Tweeet
  include Params

  def index
    @tweeets = Tweeet.all
    @tweeet = Tweeet.new
  end

  def show;end

  def edit;end

  def create
    @tweeet = current_user.tweeets.build(tweeet_params)
    respond_to do |format|
      if @tweeet.save
        format.js { flash.now[:notice] = 'Tweeet was successfully created.' }
      else
        format.html { redirect_to root_path, notice: 'Can not create tweeets' }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweeet.update(tweeet_params)
        format.html { redirect_to @tweeet, notice: 'Tweeet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweeet }
      else
        format.html { render :edit }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweeet.destroy
    respond_to do |format|
      format.js { flash.now[:notice] = 'Tweeet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
