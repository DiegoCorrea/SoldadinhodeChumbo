require 'test_helper'

class LoanWeaponsControllerTest < ActionController::TestCase
  setup do
    @loan_weapon = loan_weapons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_weapons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_weapon" do
    assert_difference('LoanWeapon.count') do
      post :create, loan_weapon: { loan_id: @loan_weapon.loan_id, weapon_id: @loan_weapon.weapon_id }
    end

    assert_redirected_to loan_weapon_path(assigns(:loan_weapon))
  end

  test "should show loan_weapon" do
    get :show, id: @loan_weapon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_weapon
    assert_response :success
  end

  test "should update loan_weapon" do
    patch :update, id: @loan_weapon, loan_weapon: { loan_id: @loan_weapon.loan_id, weapon_id: @loan_weapon.weapon_id }
    assert_redirected_to loan_weapon_path(assigns(:loan_weapon))
  end

  test "should destroy loan_weapon" do
    assert_difference('LoanWeapon.count', -1) do
      delete :destroy, id: @loan_weapon
    end

    assert_redirected_to loan_weapons_path
  end
end
