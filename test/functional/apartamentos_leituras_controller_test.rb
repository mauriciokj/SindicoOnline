require 'test_helper'

class ApartamentosLeiturasControllerTest < ActionController::TestCase
  setup do
    @apartamento_leitura = apartamentos_leituras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apartamentos_leituras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apartamento_leitura" do
    assert_difference('ApartamentoLeitura.count') do
      post :create, apartamento_leitura: { consumo: @apartamento_leitura.consumo, data: @apartamento_leitura.data, leitura_apartamento: @apartamento_leitura.leitura_apartamento, valor: @apartamento_leitura.valor }
    end

    assert_redirected_to apartamento_leitura_path(assigns(:apartamento_leitura))
  end

  test "should show apartamento_leitura" do
    get :show, id: @apartamento_leitura
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apartamento_leitura
    assert_response :success
  end

  test "should update apartamento_leitura" do
    put :update, id: @apartamento_leitura, apartamento_leitura: { consumo: @apartamento_leitura.consumo, data: @apartamento_leitura.data, leitura_apartamento: @apartamento_leitura.leitura_apartamento, valor: @apartamento_leitura.valor }
    assert_redirected_to apartamento_leitura_path(assigns(:apartamento_leitura))
  end

  test "should destroy apartamento_leitura" do
    assert_difference('ApartamentoLeitura.count', -1) do
      delete :destroy, id: @apartamento_leitura
    end

    assert_redirected_to apartamentos_leituras_path
  end
end
