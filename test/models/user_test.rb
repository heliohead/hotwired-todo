require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "must have a valid fixture" do
    assert users(:one).valid?
  end

  test "validate presence of username" do
    user = User.new

    refute user.valid?
    assert_equal user.errors.full_messages, ["Username can't be blank"]
  end

  test "validate uniqueness of username" do
    user = User.new(username: users(:one).username)

    refute user.valid?
    assert_equal user.errors.full_messages, ["Username has already been taken"]
  end
end
