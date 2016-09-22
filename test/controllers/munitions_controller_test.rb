require 'test_helper'

class MunitionsControllerTest < ActionController::TestCase
  setup do
    @munition = munitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:munitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create munition" do
    assert_difference('Munition.count') do
      post :create, munition: { caliber: @munition.caliber, description: @munition.description }
    end

    assert_redirected_to munition_path(assigns(:munition))
  end

  test "should show munition" do
    get :show, id: @munition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @munition
    assert_response :success
  end

  test "should update munition" do
    patch :update, id: @munition, munition: { caliber: @munition.caliber, description: @munition.description }
    assert_redirected_to munition_path(assigns(:munition))
  end

  test "should destroy munition" do
    assert_difference('Munition.count', -1) do
      delete :destroy, id: @munition
    end

    assert_redirected_to munitions_path
  end
end
