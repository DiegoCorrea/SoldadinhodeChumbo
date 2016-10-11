class LoanAccessoriesController < ApplicationController
  before_action :set_loan_accessory, only: [:show, :edit, :update, :destroy]
  # GET /loan_accessories/1
  # GET /loan_accessories/1.json
  def show
  end

  # GET /loan_accessories/new
  def new
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])

    @loan_accessory = @loan.loan_accessories.build
    @accessories = Accessory.where(garrison: @reserve.garrison).where.not("amount <= ?",0)
  end

  # GET /loan_accessories/1/edit
  def edit
  end

  # POST /loan_accessories
  # POST /loan_accessories.json
  def create
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @soldier = Soldier.find(params[:soldier_id])
    @loan = Loan.find(params[:loan_id])

    @loan_accessory = @loan.loan_accessories.build(loan_accessory_params)
    @loan_accessory.loan = @loan
    @loan_accessory.reserve = @reserve

    @loan_accessory_log = @loan.loan_accessory_logs.build(loan_accessory_params)
    @loan_accessory_log.loan = @loan
    @loan_accessory_log.reserve = @reserve

    @accessory = Accessory.find(@loan_accessory.accessory)
    if @accessory.amount >= @loan_accessory.amount
      @accessory.amount -= @loan_accessory.amount

      respond_to do |format|
        if @loan_accessory.save and @loan_accessory_log.save and @accessory.save
          format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Loan accessory was successfully created.' }
          format.json { render :show, status: :created, location: reserf_soldier_loan_path(@reserve,@soldier,@loan) }
        else
          format.html { render :new }
          format.json { render json: @loan_accessory.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to new_reserf_soldier_loan_loan_accessory_path(@reserve,@soldier,@loan), notice: 'Não se pode pegar mais acessorios do que tem na Reserva.' }
        format.json { render :show, status: :created, location: new_reserf_soldier_loan_loan_accessory_path(@reserve,@soldier,@loan) }
      end
    end
  end

  # PATCH/PUT /loan_accessories/1
  # PATCH/PUT /loan_accessories/1.json
  def update
    respond_to do |format|
      if @loan_accessory.update(loan_accessory_params)
        format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Loan accessory was successfully updated.' }
        format.json { render :show, status: :ok, location: reserf_soldier_loan_path(@reserve,@soldier,@loan) }
      else
        format.html { render :edit }
        format.json { render json: @loan_accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_accessories/1
  # DELETE /loan_accessories/1.json
  def destroy
    @accessory = Accessory.find(@loan_accessory.accessory)
    @accessory.amount += @loan_accessory.amount
    @accessory.save
    @loan_accessory.destroy
    respond_to do |format|
      format.html { redirect_to reserf_soldier_loan_path(@reserve,@soldier,@loan), notice: 'Loan accessory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_accessory
      @reserve = Reserve.where(id: params[:reserf_id]).first
      @soldier = Soldier.find(params[:soldier_id])
      @loan = Loan.find(params[:loan_id])
      @loan_accessory = LoanAccessory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_accessory_params
      params.require(:loan_accessory).permit(:accessory_id, :amount)
    end
end
