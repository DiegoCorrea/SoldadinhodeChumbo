class LoanAccessoriesController < ApplicationController
  before_action :set_loan_accessory, only: [:show, :edit, :update, :destroy]

  # GET /loan_accessories
  # GET /loan_accessories.json
  def index
    @loan_accessories = LoanAccessory.all
  end

  # GET /loan_accessories/1
  # GET /loan_accessories/1.json
  def show
  end

  # GET /loan_accessories/new
  def new
    @loan_accessory = LoanAccessory.new
  end

  # GET /loan_accessories/1/edit
  def edit
  end

  # POST /loan_accessories
  # POST /loan_accessories.json
  def create
    @loan_accessory = LoanAccessory.new(loan_accessory_params)

    respond_to do |format|
      if @loan_accessory.save
        format.html { redirect_to @loan_accessory, notice: 'Loan accessory was successfully created.' }
        format.json { render :show, status: :created, location: @loan_accessory }
      else
        format.html { render :new }
        format.json { render json: @loan_accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_accessories/1
  # PATCH/PUT /loan_accessories/1.json
  def update
    respond_to do |format|
      if @loan_accessory.update(loan_accessory_params)
        format.html { redirect_to @loan_accessory, notice: 'Loan accessory was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_accessory }
      else
        format.html { render :edit }
        format.json { render json: @loan_accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_accessories/1
  # DELETE /loan_accessories/1.json
  def destroy
    @loan_accessory.destroy
    respond_to do |format|
      format.html { redirect_to loan_accessories_url, notice: 'Loan accessory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_accessory
      @loan_accessory = LoanAccessory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_accessory_params
      params.require(:loan_accessory).permit(:loan_id, :accessory_id, :reserve_id, :amount)
    end
end
