class LoanAccessoryLogsController < ApplicationController
  before_action :set_loan_accessory_log, only: [:show, :edit, :update, :destroy]

  # GET /loan_accessory_logs
  # GET /loan_accessory_logs.json
  def index
    @loan_accessory_logs = LoanAccessoryLog.all
  end

  # GET /loan_accessory_logs/1
  # GET /loan_accessory_logs/1.json
  def show
  end

  # GET /loan_accessory_logs/new
  def new
    @loan_accessory_log = LoanAccessoryLog.new
  end

  # GET /loan_accessory_logs/1/edit
  def edit
  end

  # POST /loan_accessory_logs
  # POST /loan_accessory_logs.json
  def create
    @loan_accessory_log = LoanAccessoryLog.new(loan_accessory_log_params)

    respond_to do |format|
      if @loan_accessory_log.save
        format.html { redirect_to @loan_accessory_log, notice: 'Loan accessory log was successfully created.' }
        format.json { render :show, status: :created, location: @loan_accessory_log }
      else
        format.html { render :new }
        format.json { render json: @loan_accessory_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_accessory_logs/1
  # PATCH/PUT /loan_accessory_logs/1.json
  def update
    respond_to do |format|
      if @loan_accessory_log.update(loan_accessory_log_params)
        format.html { redirect_to @loan_accessory_log, notice: 'Loan accessory log was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_accessory_log }
      else
        format.html { render :edit }
        format.json { render json: @loan_accessory_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_accessory_logs/1
  # DELETE /loan_accessory_logs/1.json
  def destroy
    @loan_accessory_log.destroy
    respond_to do |format|
      format.html { redirect_to loan_accessory_logs_url, notice: 'Loan accessory log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_accessory_log
      @loan_accessory_log = LoanAccessoryLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_accessory_log_params
      params.require(:loan_accessory_log).permit(:loan_id, :accessory_id, :reserve_id, :amount)
    end
end
