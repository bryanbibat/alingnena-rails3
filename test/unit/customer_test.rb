require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "should set the record as active on create" do
    customer = Customer.create :name => "name", :active => false
    customer.reload
    assert customer.active?
  end

  test "should not delete record from database when destroyed" do
    customer = customers :active
    customer.destroy
    assert !customer.destroyed?
  end

  test "should deactivate record when destroyed" do
    customer = customers :active
    customer.destroy
    assert !customer.active?
  end
end
