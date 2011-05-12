require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "should set the record as active on create" do
    customer = Customer.create :name => "name", :active => false
    customer.reload
    assert customer.active?
  end
end
