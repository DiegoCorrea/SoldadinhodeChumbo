class LoanWeaponsController < ApplicationController
  before_action :set_loan_weapon, only: [:show, :edit, :update, :destroy]

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
    @loan_weapon = LoanWeapon.new
  end

  # GET /loan_weapons/1/edit
  def edit
  end

  # POST /loan_weapons
  # POST /loan_weapons.json
  def create
    @loan_weapon = LoanWeapon.new(loan_weapon_params)

    respond_to do |format|
      if @loan_weapon.save
        format.html { redirect_to @loan_weapon, notice: 'Loan weapon was successfully created.' }
        format.json { render :show, status: :created, location: @loan_weapon }
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
    respond_to do |format|
      format.html { redirect_to loan_weapons_url, notice: 'Loan weapon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_weapon
      @loan_weapon = LoanWeapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_weapon_params
      params.require(:loan_weapon).permit(:loan_id, :weapon_id)
    end
end
