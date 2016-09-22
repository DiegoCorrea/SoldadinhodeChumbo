class MunitionsController < ApplicationController
  before_action :set_munition, only: [:show, :edit, :update, :destroy]

  # GET /munitions
  # GET /munitions.json
  def index
    @munitions = Munition.all
  end

  # GET /munitions/1
  # GET /munitions/1.json
  def show
  end

  # GET /munitions/new
  def new
    @munition = Munition.new
  end

  # GET /munitions/1/edit
  def edit
  end

  # POST /munitions
  # POST /munitions.json
  def create
    @munition = Munition.new(munition_params)

    respond_to do |format|
      if @munition.save
        format.html { redirect_to @munition, notice: 'Munition was successfully created.' }
        format.json { render :show, status: :created, location: @munition }
      else
        format.html { render :new }
        format.json { render json: @munition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /munitions/1
  # PATCH/PUT /munitions/1.json
  def update
    respond_to do |format|
      if @munition.update(munition_params)
        format.html { redirect_to @munition, notice: 'Munition was successfully updated.' }
        format.json { render :show, status: :ok, location: @munition }
      else
        format.html { render :edit }
        format.json { render json: @munition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /munitions/1
  # DELETE /munitions/1.json
  def destroy
    @munition.destroy
    respond_to do |format|
      format.html { redirect_to munitions_url, notice: 'Munition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_munition
      @munition = Munition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def munition_params
      params.require(:munition).permit(:caliber, :description)
    end
end
