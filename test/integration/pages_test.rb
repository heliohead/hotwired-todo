require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visit index" do
    visit root_url

    assert_selector "h1", text: "Todos"
  end
end
