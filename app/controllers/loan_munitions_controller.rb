class LoanMunitionsController < ApplicationController
  before_action :set_loan_munition, only: [:show, :edit, :update, :destroy]

  # GET /loan_munitions
  # GET /loan_munitions.json
  def index
  end

  # GET /loan_munitions/1
  # GET /loan_munitions/1.json
  def show
  end

  # GET /loan_munitions/new
  def new
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])
    
    @loan_munition = @loan.loan_munitions.build

    @munitions = Munition.where(garrison: @reserve.garrison).where.not("amount <= ?",0)
  end

  # GET /loan_munitions/1/edit
  def edit
  end

  # POST /loan_munitions
  # POST /loan_munitions.json
  def create
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])
    
    @loan_munition = @loan.loan_munitions.build(loan_munition_params)
    @loan_munition.loan = @loan
    @loan_munition.reserve = @reserve

    @loan_munition_log = @loan.loan_munition_logs.build(loan_munition_params)
    @loan_munition_log.loan = @loan
    @loan_munition_log.reserve = @reserve

    @munition = Munition.find(@loan_munition.munition)
    
    if @munition.amount >= @loan_munition.amount
      @munition.amount -= @loan_munition.amount

      respond_to do |format|
        if @loan_munition.save and @munition.save and @loan_munition_log.save
          format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Loan munition was successfully created.' }
          format.json { render :show, status: :created, location: reserf_soldier_loan_path(@reserve,@soldier,@loan) }
        else
          format.html { render :new }
          format.json { render json: @loan_munition.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to new_reserf_soldier_loan_loan_munition_path(@reserve,@soldier,@loan), notice: 'Só se pode pegar até a quantidade que tem na Reserva' }
        format.json { render :show, status: :created, location: reserf_soldier_loan_loan_munition_path(@reserve,@soldier,@loan) }
      end
    end
  end

  # PATCH/PUT /loan_munitions/1
  # PATCH/PUT /loan_munitions/1.json
  def update
    respond_to do |format|
      if @loan_munition.update(loan_munition_params)
        format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Loan munition was successfully updated.' }
        format.json { render :show, status: :ok, location: reserf_soldier_loan_path(@reserve,@soldier,@loan) }
      else
        format.html { render :edit }
        format.json { render json: @loan_munition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_munitions/1
  # DELETE /loan_munitions/1.json
  def destroy
    @munition = Munition.find(@loan_munition.munition)
    @munition.amount += @loan_munition.amount
    @munition.save
    @loan_munition.destroy
    respond_to do |format|
      format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Loan munition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_munition
      @reserve = Reserve.where(id: params[:reserf_id]).first
      @soldier = Soldier.find(params[:soldier_id])
      @loan = Loan.find(params[:loan_id])
      @loan_munition = LoanMunition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_munition_params
      params.require(:loan_munition).permit(:munition_id, :amount)
    end
end
