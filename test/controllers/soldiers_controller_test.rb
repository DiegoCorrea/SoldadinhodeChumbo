require 'test_helper'

class SoldiersControllerTest < ActionController::TestCase
  setup do
    @soldier = soldiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soldiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soldier" do
    assert_difference('Soldier.count') do
      post :create, soldier: { function: @soldier.function, reserve_id: @soldier.reserve_id, warName: @soldier.warName }
    end

    assert_redirected_to soldier_path(assigns(:soldier))
  end

  test "should show soldier" do
    get :show, id: @soldier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soldier
    assert_response :success
  end

  test "should update soldier" do
    patch :update, id: @soldier, soldier: { function: @soldier.function, reserve_id: @soldier.reserve_id, warName: @soldier.warName }
    assert_redirected_to soldier_path(assigns(:soldier))
  end

  test "should destroy soldier" do
    assert_difference('Soldier.count', -1) do
      delete :destroy, id: @soldier
    end

    assert_redirected_to soldiers_path
  end
end
