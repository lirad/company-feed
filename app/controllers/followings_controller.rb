class FollowingsController < ApplicationController
  before_action :set_following, only: %i[show edit update destroy]

  # GET /followings
  # GET /followings.json
  def index
    @followings = Following.all
  end

  # GET /followings/1
  # GET /followings/1.json
  def show; end

  # GET /followings/new
  def new
    @following = Following.new
  end

  # GET /followings/1/edit
  def edit; end

  # POST /followings
  # POST /followings.json
  def create
    @following = current_user.following_relationships.create(following_params)

    redirect_to profile_path(following_params[:FollowedId]), notice: 'Post has been saved successfully.'
  end

  # PATCH/PUT /followings/1
  # PATCH/PUT /followings/1.json
  def update
    respond_to do |format|
      if @following.update(following_params)
        format.html { redirect_to @following, notice: 'Following was successfully updated.' }
        format.json { render :show, status: :ok, location: @following }
      else
        format.html { render :edit }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followings/1
  # DELETE /followings/1.json
  def destroy
    current_user.following_relationships.find_by(FollowedId: following_params[:FollowedId]).destroy
    redirect_to profile_path(following_params[:FollowedId]), notice: 'Post has been saved successfully.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_following
    @following = current_user.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def following_params
    params.require(:following).permit(:FollowerId, :FollowedId)
  end
end
