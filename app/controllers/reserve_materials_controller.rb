class ReserveMaterialsController < ApplicationController
  before_action :set_reserve_material, only: [:show, :edit, :update, :destroy]
  before_action :set_unallocated, only: [:new, :edit]

  # GET /reserve_materials
  # GET /reserve_materials.json
  def index
    @reserve_materials = ReserveMaterial.all

    @reserveMaterialsAllocated = ReserveMaterial.where(:active => true).order("updated_at DESC")
  end

  # GET /reserve_materials/1
  # GET /reserve_materials/1.json
  def show
  end

  # GET /reserve_materials/new
  def new
    @reserve_material = ReserveMaterial.new
  end

  # GET /reserve_materials/1/edit
  def edit
  end

  # POST /reserve_materials
  # POST /reserve_materials.json
  def create
    @reserve_material = ReserveMaterial.new(reserve_material_params)
    @reserve_material.active = true
    @reserve_material.weapons.allocated = true
    @reserve_material.munitions.allocated = true
    @reserve_material.accessories.allocated = true

    respond_to do |format|
      if @reserve_material.save
        format.html { redirect_to @reserve_material, notice: 'Reserve material was successfully created.' }
        format.json { render :show, status: :created, location: @reserve_material }
      else
        format.html { render :new }
        format.json { render json: @reserve_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserve_materials/1
  # PATCH/PUT /reserve_materials/1.json
  def update
    respond_to do |format|
      if @reserve_material.update(reserve_material_params)
        format.html { redirect_to @reserve_material, notice: 'Reserve material was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserve_material }
      else
        format.html { render :edit }
        format.json { render json: @reserve_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserve_materials/1
  # DELETE /reserve_materials/1.json
  def destroy
    @reserve_material.destroy
    respond_to do |format|
      format.html { redirect_to reserve_materials_url, notice: 'Reserve material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserve_material
      @reserve_material = ReserveMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserve_material_params
      params.require(:reserve_material).permit(:weapons_id, :accessories_id, :munitions_id)
    end

    def set_unallocated
      @weaponsUnallocated = Weapon.where(:allocated => false).order("serialNumber ASC")
      @munitionsUnallocated = Munition.where(:allocated => false).order("caliber ASC")
      @accessoriesUnallocated = Accessory.where(:allocated => false).order("description ASC")
    end
end
