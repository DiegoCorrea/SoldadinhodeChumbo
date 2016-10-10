require 'test_helper'

class LoanMunitionLogsControllerTest < ActionController::TestCase
  setup do
    @loan_munition_log = loan_munition_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_munition_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_munition_log" do
    assert_difference('LoanMunitionLog.count') do
      post :create, loan_munition_log: { amount: @loan_munition_log.amount, loan_id: @loan_munition_log.loan_id, munition_id: @loan_munition_log.munition_id, reserve_id: @loan_munition_log.reserve_id }
    end

    assert_redirected_to loan_munition_log_path(assigns(:loan_munition_log))
  end

  test "should show loan_munition_log" do
    get :show, id: @loan_munition_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_munition_log
    assert_response :success
  end

  test "should update loan_munition_log" do
    patch :update, id: @loan_munition_log, loan_munition_log: { amount: @loan_munition_log.amount, loan_id: @loan_munition_log.loan_id, munition_id: @loan_munition_log.munition_id, reserve_id: @loan_munition_log.reserve_id }
    assert_redirected_to loan_munition_log_path(assigns(:loan_munition_log))
  end

  test "should destroy loan_munition_log" do
    assert_difference('LoanMunitionLog.count', -1) do
      delete :destroy, id: @loan_munition_log
    end

    assert_redirected_to loan_munition_logs_path
  end
end
