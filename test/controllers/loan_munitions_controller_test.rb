require 'test_helper'

class LoanMunitionsControllerTest < ActionController::TestCase
  setup do
    @loan_munition = loan_munitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_munitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_munition" do
    assert_difference('LoanMunition.count') do
      post :create, loan_munition: { amount: @loan_munition.amount, loan_id: @loan_munition.loan_id, munition_id: @loan_munition.munition_id, reserve_id: @loan_munition.reserve_id }
    end

    assert_redirected_to loan_munition_path(assigns(:loan_munition))
  end

  test "should show loan_munition" do
    get :show, id: @loan_munition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_munition
    assert_response :success
  end

  test "should update loan_munition" do
    patch :update, id: @loan_munition, loan_munition: { amount: @loan_munition.amount, loan_id: @loan_munition.loan_id, munition_id: @loan_munition.munition_id, reserve_id: @loan_munition.reserve_id }
    assert_redirected_to loan_munition_path(assigns(:loan_munition))
  end

  test "should destroy loan_munition" do
    assert_difference('LoanMunition.count', -1) do
      delete :destroy, id: @loan_munition
    end

    assert_redirected_to loan_munitions_path
  end
end
