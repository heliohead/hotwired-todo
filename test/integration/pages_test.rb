require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visit index" do
    visit root_url

    assert_selector "h1", text: "TODO App"
    assert page.has_content?("New User")
    assert page.has_content?("TODOs")
    assert page.has_content?("Active TODOs")
    assert page.has_content?("Completed TODOs")
  end
end
