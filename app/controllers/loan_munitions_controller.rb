class LoanMunitionsController < ApplicationController
  before_action :set_loan_munition, only: [:show, :edit, :update, :destroy]

  # GET /loan_munitions
  # GET /loan_munitions.json
  def index
    @loan_munitions = LoanMunition.all
  end

  # GET /loan_munitions/1
  # GET /loan_munitions/1.json
  def show
  end

  # GET /loan_munitions/new
  def new
    @loan_munition = LoanMunition.new
  end

  # GET /loan_munitions/1/edit
  def edit
  end

  # POST /loan_munitions
  # POST /loan_munitions.json
  def create
    @loan_munition = LoanMunition.new(loan_munition_params)

    respond_to do |format|
      if @loan_munition.save
        format.html { redirect_to @loan_munition, notice: 'Loan munition was successfully created.' }
        format.json { render :show, status: :created, location: @loan_munition }
      else
        format.html { render :new }
        format.json { render json: @loan_munition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_munitions/1
  # PATCH/PUT /loan_munitions/1.json
  def update
    respond_to do |format|
      if @loan_munition.update(loan_munition_params)
        format.html { redirect_to @loan_munition, notice: 'Loan munition was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_munition }
      else
        format.html { render :edit }
        format.json { render json: @loan_munition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_munitions/1
  # DELETE /loan_munitions/1.json
  def destroy
    @loan_munition.destroy
    respond_to do |format|
      format.html { redirect_to loan_munitions_url, notice: 'Loan munition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_munition
      @loan_munition = LoanMunition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_munition_params
      params.require(:loan_munition).permit(:loan_id, :munition_id, :reserve_id, :amount)
    end
end
