require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  test "create todo" do
    visit root_url
    find("#todo_title").set("New todo inserted")
    find("#todo_user_id").find(:xpath, "option[2]").select_option
    click_button(id: "todo-submit")

    assert page.has_content?("New todo inserted")
    refute page.has_content?("User must exist")
  end

  test "do not create todo without user" do
    visit root_url
    find("#todo_title").set("New todo inserted")
    click_button(id: "todo-submit")

    refute page.has_content?("New todo inserted")
    assert page.has_content?("User must exist")
  end

  test "active completed todo" do
    visit root_url
    find("button[data-status='completed'").click

    assert has_button?("Uncomplete")
    assert has_no_button?("Complete")
  end

  test "completed active todo" do
    visit root_url
    find("button[data-status='active'").click

    assert has_button?("Complete")
    assert has_no_button?("Uncomplete")
  end
end
