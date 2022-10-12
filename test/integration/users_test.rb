require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "create new user and show success message" do
    visit root_url
    find("#user_username").set("New user")
    click_button(id: "user-submit")

    assert page.has_content?("User was successfully created.")
    refute page.has_content?("Username has already been taken")
  end

  test "error when username already taken" do
    visit root_url
    find("#user_username").set(users(:one).username)
    click_button(id: "user-submit")

    assert page.has_content?("Username has already been taken")
    refute page.has_content?("User was successfully created.")
  end

  test "error when username is empty" do
    visit root_url
    click_button(id: "user-submit")

    assert page.has_content?("Username can't be blank")
    refute page.has_content?("User was successfully created.")
  end

  test "update select for user when create user" do
    name = "user-create1"
    visit root_url
    find("#user_username").set(name)
    click_button(id: "user-submit")

    assert page.has_content?("User was successfully created.")
    assert find("#todo_user_id").text.include?(name)
  end
end
