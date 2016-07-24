require 'test_helper'

class CargaplantillasControllerTest < ActionController::TestCase
  setup do
    @cargaplantilla = cargaplantillas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargaplantillas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargaplantilla" do
    assert_difference('Cargaplantilla.count') do
      post :create, cargaplantilla: { titulo: @cargaplantilla.titulo }
    end

    assert_redirected_to cargaplantilla_path(assigns(:cargaplantilla))
  end

  test "should show cargaplantilla" do
    get :show, id: @cargaplantilla
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargaplantilla
    assert_response :success
  end

  test "should update cargaplantilla" do
    patch :update, id: @cargaplantilla, cargaplantilla: { titulo: @cargaplantilla.titulo }
    assert_redirected_to cargaplantilla_path(assigns(:cargaplantilla))
  end

  test "should destroy cargaplantilla" do
    assert_difference('Cargaplantilla.count', -1) do
      delete :destroy, id: @cargaplantilla
    end

    assert_redirected_to cargaplantillas_path
  end
end
