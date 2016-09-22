require 'test_helper'

class ReserveMaterialsControllerTest < ActionController::TestCase
  setup do
    @reserve_material = reserve_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reserve_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserve_material" do
    assert_difference('ReserveMaterial.count') do
      post :create, reserve_material: { accessories_id: @reserve_material.accessories_id, munitions_id: @reserve_material.munitions_id, weapons_id: @reserve_material.weapons_id }
    end

    assert_redirected_to reserve_material_path(assigns(:reserve_material))
  end

  test "should show reserve_material" do
    get :show, id: @reserve_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reserve_material
    assert_response :success
  end

  test "should update reserve_material" do
    patch :update, id: @reserve_material, reserve_material: { accessories_id: @reserve_material.accessories_id, munitions_id: @reserve_material.munitions_id, weapons_id: @reserve_material.weapons_id }
    assert_redirected_to reserve_material_path(assigns(:reserve_material))
  end

  test "should destroy reserve_material" do
    assert_difference('ReserveMaterial.count', -1) do
      delete :destroy, id: @reserve_material
    end

    assert_redirected_to reserve_materials_path
  end
end
