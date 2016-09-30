class ReservesController < ApplicationController
  before_action :set_reserve, only: [:show, :edit, :update, :destroy]

  # GET /reserves
  # GET /reserves.json
  def index
    @reserves = Reserve.all
  end

  # GET /reserves/1
  # GET /reserves/1.json
  def show
    @soldiers = @reserve.soldiers
  end

  # GET /reserves/new
  def new
    @reserve = Reserve.new
    @reserve.build_garrison
  end

  # GET /reserves/1/edit
  def edit
  end

  # POST /reserves
  # POST /reserves.json
  def create
    @reserve = Reserve.new(reserve_params)
    @reserve.build_garrison

    respond_to do |format|
      if @reserve.save
        format.html { redirect_to reserves_path, notice: 'Reserve was successfully created.' }
        format.json { render :show, status: :created, location: reserves_path }
      else
        format.html { render :new }
        format.json { render json: @reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserves/1
  # PATCH/PUT /reserves/1.json
  def update
    respond_to do |format|
      if @reserve.update(reserve_params)
        format.html { redirect_to reserves_path, notice: 'Reserve was successfully updated.' }
        format.json { render :show, status: :ok, location: reserves_path }
      else
        format.html { render :edit }
        format.json { render json: @reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserves/1
  # DELETE /reserves/1.json
  def destroy
    @reserve.destroy
    respond_to do |format|
      format.html { redirect_to reserves_url, notice: 'Reserve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserve
      @reserve = Reserve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserve_params
      params.require(:reserve).permit(:initials, :description)
    end

end
