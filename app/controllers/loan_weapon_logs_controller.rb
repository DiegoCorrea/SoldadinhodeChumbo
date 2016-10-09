class LoanWeaponLogsController < ApplicationController
  before_action :set_loan_weapon_log, only: [:show, :edit, :update, :destroy]

  # GET /loan_weapon_logs
  # GET /loan_weapon_logs.json
  def index
    @loan_weapon_logs = LoanWeaponLog.all
  end

  # GET /loan_weapon_logs/1
  # GET /loan_weapon_logs/1.json
  def show
  end

  # GET /loan_weapon_logs/new
  def new
    @loan_weapon_log = LoanWeaponLog.new
  end

  # GET /loan_weapon_logs/1/edit
  def edit
  end

  # POST /loan_weapon_logs
  # POST /loan_weapon_logs.json
  def create
    @loan_weapon_log = LoanWeaponLog.new(loan_weapon_log_params)

    respond_to do |format|
      if @loan_weapon_log.save
        format.html { redirect_to @loan_weapon_log, notice: 'Loan weapon log was successfully created.' }
        format.json { render :show, status: :created, location: @loan_weapon_log }
      else
        format.html { render :new }
        format.json { render json: @loan_weapon_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_weapon_logs/1
  # PATCH/PUT /loan_weapon_logs/1.json
  def update
    respond_to do |format|
      if @loan_weapon_log.update(loan_weapon_log_params)
        format.html { redirect_to @loan_weapon_log, notice: 'Loan weapon log was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_weapon_log }
      else
        format.html { render :edit }
        format.json { render json: @loan_weapon_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_weapon_logs/1
  # DELETE /loan_weapon_logs/1.json
  def destroy
    @loan_weapon_log.destroy
    respond_to do |format|
      format.html { redirect_to loan_weapon_logs_url, notice: 'Loan weapon log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_weapon_log
      @loan_weapon_log = LoanWeaponLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_weapon_log_params
      params.require(:loan_weapon_log).permit(:loan_id, :weapon_id, :reserve_id)
    end
end
