require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "User must have a valid fixture" do
    assert users(:one).valid?
  end
end
