class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.includes(user: [Photo_attachment: [:blob]]).all.order('created_at DESC')
    @opinion = Opinion.new
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show; end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = current_user.opinions.build(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to index, notice: 'Opinion was successfully created.' }
        format.json { render :index, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opinion
    @opinion = Opinion.find(current_user.id)
  end

  # Only allow a list of trusted parameters through.
  def opinion_params
    params.require(:opinion).permit(:AuthorId, :Text)
  end
end
