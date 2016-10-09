require 'test_helper'

class LoanWeaponLogsControllerTest < ActionController::TestCase
  setup do
    @loan_weapon_log = loan_weapon_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_weapon_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_weapon_log" do
    assert_difference('LoanWeaponLog.count') do
      post :create, loan_weapon_log: { loan_id: @loan_weapon_log.loan_id, reserve_id: @loan_weapon_log.reserve_id, weapon_id: @loan_weapon_log.weapon_id }
    end

    assert_redirected_to loan_weapon_log_path(assigns(:loan_weapon_log))
  end

  test "should show loan_weapon_log" do
    get :show, id: @loan_weapon_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_weapon_log
    assert_response :success
  end

  test "should update loan_weapon_log" do
    patch :update, id: @loan_weapon_log, loan_weapon_log: { loan_id: @loan_weapon_log.loan_id, reserve_id: @loan_weapon_log.reserve_id, weapon_id: @loan_weapon_log.weapon_id }
    assert_redirected_to loan_weapon_log_path(assigns(:loan_weapon_log))
  end

  test "should destroy loan_weapon_log" do
    assert_difference('LoanWeaponLog.count', -1) do
      delete :destroy, id: @loan_weapon_log
    end

    assert_redirected_to loan_weapon_logs_path
  end
end
