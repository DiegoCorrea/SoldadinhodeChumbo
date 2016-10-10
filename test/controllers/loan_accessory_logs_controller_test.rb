require 'test_helper'

class LoanAccessoryLogsControllerTest < ActionController::TestCase
  setup do
    @loan_accessory_log = loan_accessory_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_accessory_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_accessory_log" do
    assert_difference('LoanAccessoryLog.count') do
      post :create, loan_accessory_log: { accessory_id: @loan_accessory_log.accessory_id, amount: @loan_accessory_log.amount, loan_id: @loan_accessory_log.loan_id, reserve_id: @loan_accessory_log.reserve_id }
    end

    assert_redirected_to loan_accessory_log_path(assigns(:loan_accessory_log))
  end

  test "should show loan_accessory_log" do
    get :show, id: @loan_accessory_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_accessory_log
    assert_response :success
  end

  test "should update loan_accessory_log" do
    patch :update, id: @loan_accessory_log, loan_accessory_log: { accessory_id: @loan_accessory_log.accessory_id, amount: @loan_accessory_log.amount, loan_id: @loan_accessory_log.loan_id, reserve_id: @loan_accessory_log.reserve_id }
    assert_redirected_to loan_accessory_log_path(assigns(:loan_accessory_log))
  end

  test "should destroy loan_accessory_log" do
    assert_difference('LoanAccessoryLog.count', -1) do
      delete :destroy, id: @loan_accessory_log
    end

    assert_redirected_to loan_accessory_logs_path
  end
end
