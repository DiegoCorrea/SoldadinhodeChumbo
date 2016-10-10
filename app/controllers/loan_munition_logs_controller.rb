class LoanMunitionLogsController < ApplicationController
  before_action :set_loan_munition_log, only: [:show, :edit, :update, :destroy]

  # GET /loan_munition_logs
  # GET /loan_munition_logs.json
  def index
    @loan_munition_logs = LoanMunitionLog.all
  end

  # GET /loan_munition_logs/1
  # GET /loan_munition_logs/1.json
  def show
  end

  # GET /loan_munition_logs/new
  def new
    @loan_munition_log = LoanMunitionLog.new
  end

  # GET /loan_munition_logs/1/edit
  def edit
  end

  # POST /loan_munition_logs
  # POST /loan_munition_logs.json
  def create
    @loan_munition_log = LoanMunitionLog.new(loan_munition_log_params)

    respond_to do |format|
      if @loan_munition_log.save
        format.html { redirect_to @loan_munition_log, notice: 'Loan munition log was successfully created.' }
        format.json { render :show, status: :created, location: @loan_munition_log }
      else
        format.html { render :new }
        format.json { render json: @loan_munition_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_munition_logs/1
  # PATCH/PUT /loan_munition_logs/1.json
  def update
    respond_to do |format|
      if @loan_munition_log.update(loan_munition_log_params)
        format.html { redirect_to @loan_munition_log, notice: 'Loan munition log was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_munition_log }
      else
        format.html { render :edit }
        format.json { render json: @loan_munition_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_munition_logs/1
  # DELETE /loan_munition_logs/1.json
  def destroy
    @loan_munition_log.destroy
    respond_to do |format|
      format.html { redirect_to loan_munition_logs_url, notice: 'Loan munition log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_munition_log
      @loan_munition_log = LoanMunitionLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_munition_log_params
      params.require(:loan_munition_log).permit(:loan_id, :munition_id, :reserve_id, :amount)
    end
end
