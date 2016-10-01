class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:show, :edit, :update, :destroy]

  # GET /weapons
  # GET /weapons.json
  def index
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @weapons = @reserve.garrison.weapons
  end

  # GET /weapons/1
  # GET /weapons/1.json
  def show
  end

  # GET /weapons/new
  def new
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @weapon = @reserve.garrison.weapons.build
  end

  # GET /weapons/1/edit
  def edit
  end

  # POST /weapons
  # POST /weapons.json
  def create
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @weapon = @reserve.garrison.weapons.build(weapon_params)

    respond_to do |format|
      if @weapon.save
        format.html { redirect_to reserf_garrisons_path, notice: 'Weapon was successfully created.' }
        format.json { render :show, status: :created, location: reserf_garrisons_path }
      else
        format.html { render :new }
        format.json { render json: @weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weapons/1
  # PATCH/PUT /weapons/1.json
  def update
    respond_to do |format|
      if @weapon.update(weapon_params)
        format.html { redirect_to reserf_garrisons_path, notice: 'Weapon was successfully updated.' }
        format.json { render :show, status: :ok, location: reserf_garrisons_path }
      else
        format.html { render :edit }
        format.json { render json: @weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapons/1
  # DELETE /weapons/1.json
  def destroy
    @weapon.destroy
    respond_to do |format|
      format.html { redirect_to reserf_garrisons_url, notice: 'Weapon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon
      @reserve = Reserve.where(id: params[:reserf_id]).first
      @garrison = @reserve.garrison
      @weapon = Weapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weapon_params
      params.require(:weapon).permit(:serialNumber, :model, :factory, :garrison)
    end
end
