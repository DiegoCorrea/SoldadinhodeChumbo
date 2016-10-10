require 'test_helper'

class LoanAccessoriesControllerTest < ActionController::TestCase
  setup do
    @loan_accessory = loan_accessories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_accessories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_accessory" do
    assert_difference('LoanAccessory.count') do
      post :create, loan_accessory: { accessory_id: @loan_accessory.accessory_id, amount: @loan_accessory.amount, loan_id: @loan_accessory.loan_id, reserve_id: @loan_accessory.reserve_id }
    end

    assert_redirected_to loan_accessory_path(assigns(:loan_accessory))
  end

  test "should show loan_accessory" do
    get :show, id: @loan_accessory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_accessory
    assert_response :success
  end

  test "should update loan_accessory" do
    patch :update, id: @loan_accessory, loan_accessory: { accessory_id: @loan_accessory.accessory_id, amount: @loan_accessory.amount, loan_id: @loan_accessory.loan_id, reserve_id: @loan_accessory.reserve_id }
    assert_redirected_to loan_accessory_path(assigns(:loan_accessory))
  end

  test "should destroy loan_accessory" do
    assert_difference('LoanAccessory.count', -1) do
      delete :destroy, id: @loan_accessory
    end

    assert_redirected_to loan_accessories_path
  end
end
