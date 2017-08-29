require 'test_helper'

class ProdactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prodact = prodacts(:one)
  end

  test "should get index" do
    get prodacts_url
    assert_response :success
  end

  test "should get new" do
    get new_prodact_url
    assert_response :success
  end

  test "should create prodact" do
    assert_difference('Prodact.count') do
      post prodacts_url, params: { prodact: { decription: @prodact.decription, item_id: @prodact.item_id, name: @prodact.name, price: @prodact.price, quantity: @prodact.quantity } }
    end

    assert_redirected_to prodact_url(Prodact.last)
  end

  test "should show prodact" do
    get prodact_url(@prodact)
    assert_response :success
  end

  test "should get edit" do
    get edit_prodact_url(@prodact)
    assert_response :success
  end

  test "should update prodact" do
    patch prodact_url(@prodact), params: { prodact: { decription: @prodact.decription, item_id: @prodact.item_id, name: @prodact.name, price: @prodact.price, quantity: @prodact.quantity } }
    assert_redirected_to prodact_url(@prodact)
  end

  test "should destroy prodact" do
    assert_difference('Prodact.count', -1) do
      delete prodact_url(@prodact)
    end

    assert_redirected_to prodacts_url
  end
end
