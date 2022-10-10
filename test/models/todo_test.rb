require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "must have a valid fixture" do
    assert todos(:one).valid?
  end

  test "must belongs_to user" do
    assert_equal Todo.reflect_on_association(:user).macro, :belongs_to
  end
end
