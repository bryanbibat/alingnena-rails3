require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:active)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
    assert_nil assigns(:customers).detect { |customer| !customer.active? }, "Only active customers should be retrieved"
  end

  test "should not display active column" do
    get :index
    assert_select "tr>th", :text => "Active", :count => 0
    assert_select "tr>td", :text => "true", :count => 0
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, :customer => @customer.attributes
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, :id => @customer.to_param
    assert_response :success
  end

  test "should not show inactive customer" do
    get :show, :id => customers(:inactive).to_param
    assert_equal flash[:notice], "Record does not exist", "User should receive an error message upon accessing an inactive customer"
    assert_redirected_to customers_path, "User should be redirected to index on inactive customer"
  end

  test "should get edit" do
    get :edit, :id => @customer.to_param
    assert_response :success
  end

  test "should update customer" do
    put :update, :id => @customer.to_param, :customer => @customer.attributes
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.find_all_by_active(true).count', -1) do
      delete :destroy, :id => @customer.to_param
    end

    assert_redirected_to customers_path
  end
end
