class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.where(id: params[:soldier_id]).first
    @loans = Loan.where(soldier: @soldier)

    @loanActive = Loan.where(soldier: @soldier).where(active: true)
    @loansLog = Loan.where(soldier: @soldier).where(active: false)
    if @loansLog
      @loansLog.order("updated_at DESC")
    end
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = @soldier.loans.build
    if @soldier.loans.find_by_active(true)
      respond_to do |format|
        format.html { redirect_to reserf_soldier_loans_path(@reserve,@soldier), notice: 'Já existe uma cautela aberta, por favor utilize-a' }
        format.json { head :no_content }
      end
    end
  end

  # POST /loans
  # POST /loans.json
  def create
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = @soldier.loans.build(loan_params)
    @loan.active = true

    respond_to do |format|
      if @loan.save
        format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: reserf_soldier_loan_path(@loan) }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json

  def give_back_all_weapons
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])
    @loan.loan_weapons.each do |loan_weapon|
      loan_weapon.destroy
    end
    @loan = Loan.find(params[:loan_id])
    if @loan.loan_munitions.empty? and @loan.loan_weapons.empty? and @loan.loan_accessories.empty?
      @loan.active = false
      @loan.save
    end

    respond_to do |format|
      format.html { redirect_to reserf_soldier_loans_path(@reserve,@soldier), notice: 'Todas as Armas devolvidas com sucesso' }
      format.json { head :no_content }
    end
  end

  def give_back_all_munitions
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])
    @loan.loan_munitions.each do |loan_munition|
      munition = Munition.find(loan_munition.munition)
      munition.amount += loan_munition.amount
      munition.save
      loan_munition.destroy
    end
    @loan = Loan.find(params[:loan_id])
    if @loan.loan_munitions.empty? and @loan.loan_weapons.empty? and @loan.loan_accessories.empty?
      @loan.active = false
      @loan.save
    end

    respond_to do |format|
      format.html { redirect_to reserf_soldier_loans_path(@reserve,@soldier), notice: 'Todas as munições foram devolvidas com sucesso' }
      format.json { head :no_content }
    end
  end

  def give_back_all_accessories
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])
    @loan.loan_accessories.each do |loan_accessory|
      accessory = Accessory.find(loan_accessory.accessory)
      accessory.amount += loan_accessory.amount
      accessory.save
      loan_accessory.destroy
    end
    @loan = Loan.find(params[:loan_id])
    if @loan.loan_munitions.empty? and @loan.loan_weapons.empty? and @loan.loan_accessories.empty?
      @loan.active = false
      @loan.save
    end

    respond_to do |format|
      format.html { redirect_to reserf_soldier_loans_path(@reserve,@soldier), notice: 'Todas os acessorios foram devolvidas com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @reserve = Reserve.where(id: params[:reserf_id]).first
      @soldier = Soldier.find(params[:soldier_id])
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      #params.require(:loan).permit(:soldier_id, :reserf_id)
    end
end
