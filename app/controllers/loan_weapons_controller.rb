class LoanWeaponsController < ApplicationController
  before_action :set_loan_weapon, only: [:show, :edit, :update, :destroy, :destroy_all]

  # GET /loan_weapons
  # GET /loan_weapons.json
  def index
    @loan_weapons = LoanWeapon.all
  end

  # GET /loan_weapons/1
  # GET /loan_weapons/1.json
  def show
  end

  # GET /loan_weapons/new
  def new
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])
    
    @loan_weapon = @loan.loan_weapons.build
    loWeapons_ids = LoanWeapon.where(reserve_id: @reserve).collect {|p| p.weapon_id}

    @weapons = Weapon.where(garrison: @reserve.garrison).where.not(id: loWeapons_ids)
  end

  # GET /loan_weapons/1/edit
  def edit
  end

  # POST /loan_weapons
  # POST /loan_weapons.json
  def create
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])
    @loan_weapon = LoanWeapon.new(loan_weapon_params)
    @loan_weapon.loan = @loan
    @loan_weapon.reserve_id = @reserve.id

    respond_to do |format|
      if @loan_weapon.save
        format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Loan weapon was successfully created.' }
        format.json { render :show, status: :created, location: reserf_soldier_loan_path(@reserve,@soldier,@loan) }
      else
        format.html { render :new }
        format.json { render json: @loan_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_weapons/1
  # PATCH/PUT /loan_weapons/1.json
  def update
    respond_to do |format|
      if @loan_weapon.update(loan_weapon_params)
        format.html { redirect_to @loan_weapon, notice: 'Loan weapon was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_weapon }
      else
        format.html { render :edit }
        format.json { render json: @loan_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_weapons/1
  # DELETE /loan_weapons/1.json
  def destroy
    @loan_weapon.destroy
    if @loan.loan_weapons.empty?
      @loan.destroy
      respond_to do |format|
        format.html { redirect_to reserf_soldier_loans_path(@reserve,@soldier), notice: 'Toda Cautela devolvida' }
        format.json { head :no_content }
      end   
    else
      respond_to do |format|
        format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Arma devolvida com sucesso' }
        format.json { head :no_content }
      end
    end
  end

  def destroy_all
    @loan = Loan.find(params[:loan_id])

    @loan.loan_weapons.each do |loan_weapon|
      loan_weapon.destroy
    end
    if @loan.loan_weapons.empty?
      @loan.destroy      
    end

    respond_to do |format|
      format.html { redirect_to loan_weapons_url, notice: 'Todas as Armas devolvidas com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_weapon
      @reserve = Reserve.where(id: params[:reserf_id]).first
      @soldier = Soldier.find(params[:soldier_id])
      @loan = Loan.find(params[:loan_id])
      @loan_weapon = LoanWeapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_weapon_params
      params.require(:loan_weapon).permit(:weapon_id)
    end
end
