class SoldiersController < ApplicationController
  before_action :set_soldier, only: [:show, :edit, :update, :destroy]

  # GET /soldiers
  # GET /soldiers.json
  def index
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldiers = Soldier.where(reserve: params[:reserf_id])
  end

  # GET /soldiers/1
  # GET /soldiers/1.json
  def show
  end

  # GET /soldiers/new
  def new
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = @reserve.soldiers.build
  end

  # GET /soldiers/1/edit
  def edit
  end

  # POST /soldiers
  # POST /soldiers.json
  def create
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = @reserve.soldiers.build(soldier_params)
    
    respond_to do |format|
      if !@reserve.soldiers.find_by_warName(@soldier.warName)
        if @soldier.save
          format.html { redirect_to reserf_soldiers_path, notice: 'Soldier was successfully created.' }
          format.json { render :show, status: :created, location: reserf_soldiers_path }
        else
          format.html { render :new }
          format.json { render json: @soldier.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to new_reserf_soldier_path, notice: 'Soldado já existente nessa Reserva' }
        format.json { render :show, status: :created, location: new_reserf_soldier_path }
      end
    end
  end

  # PATCH/PUT /soldiers/1
  # PATCH/PUT /soldiers/1.json
  def update
    respond_to do |format|
      if @soldier.update(soldier_params)
        format.html { redirect_to reserf_soldiers_path, notice: 'Soldier was successfully updated.' }
        format.json { render :show, status: :ok, location: reserf_soldiers_path }
      else
        format.html { render :edit }
        format.json { render json: @soldier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soldiers/1
  # DELETE /soldiers/1.json
  def destroy
    @soldier.destroy
    respond_to do |format|
      format.html { redirect_to reserf_soldiers_path, notice: 'Soldier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soldier
      @reserve = Reserve.where(id: params[:reserf_id]).first
      @soldier = Soldier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soldier_params
      params.require(:soldier).permit(:function, :warName, :reserve_id)
    end
end
