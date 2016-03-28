require 'test_helper'

class SesionesControllerTest < ActionController::TestCase
  setup do
    @sesione = sesiones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sesiones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sesione" do
    assert_difference('Sesione.count') do
      post :create, sesione: { token_auth: @sesione.token_auth, user_id: @sesione.user_id }
    end

    assert_redirected_to sesione_path(assigns(:sesione))
  end

  test "should show sesione" do
    get :show, id: @sesione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sesione
    assert_response :success
  end

  test "should update sesione" do
    patch :update, id: @sesione, sesione: { token_auth: @sesione.token_auth, user_id: @sesione.user_id }
    assert_redirected_to sesione_path(assigns(:sesione))
  end

  test "should destroy sesione" do
    assert_difference('Sesione.count', -1) do
      delete :destroy, id: @sesione
    end

    assert_redirected_to sesiones_path
  end
end
