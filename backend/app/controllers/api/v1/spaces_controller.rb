class Api::V1::SpacesController < ApplicationController
  before_action :set_space, only: %i[ show edit update destroy ]

  # GET /spaces or /spaces.json
  def index
    @spaces = Space.all

    render json: @spaces
  end

  # GET /spaces/1 or /spaces/1.json
  def show
    render json: @space
  end

  # GET /spaces/new
  def new
    @space = Space.new
    render json: @space
  end

  # GET /spaces/1/edit
  def edit
  end

  # POST /spaces or /spaces.json
  def create
    @space = Space.new(space_params)
      if @space.save
        render json: @space
      else
        render json: @space.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /spaces/1 or /spaces/1.json
  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to space_url(@space), notice: "Space was successfully updated." }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1 or /spaces/1.json
  def destroy
    @space.destroy

    respond_to do |format|
      format.html { redirect_to spaces_url, notice: "Space was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def space_params
      params.require(:space).permit(:user_id, :spacecategory_id, :title, :location, :description, :space_size, :weekly_rate, :longitude, :latitude, :space_policies, :image, pictures: [])
    end
end