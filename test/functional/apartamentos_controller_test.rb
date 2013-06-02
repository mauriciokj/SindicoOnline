require 'test_helper'

class ApartamentosControllerTest < ActionController::TestCase
  setup do
    @apartamento = apartamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apartamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apartamento" do
    assert_difference('Apartamento.count') do
      post :create, apartamento: { bloco: @apartamento.bloco, numero: @apartamento.numero }
    end

    assert_redirected_to apartamento_path(assigns(:apartamento))
  end

  test "should show apartamento" do
    get :show, id: @apartamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apartamento
    assert_response :success
  end

  test "should update apartamento" do
    put :update, id: @apartamento, apartamento: { bloco: @apartamento.bloco, numero: @apartamento.numero }
    assert_redirected_to apartamento_path(assigns(:apartamento))
  end

  test "should destroy apartamento" do
    assert_difference('Apartamento.count', -1) do
      delete :destroy, id: @apartamento
    end

    assert_redirected_to apartamentos_path
  end
end
