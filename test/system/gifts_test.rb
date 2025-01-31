require "application_system_test_case"

class GiftsTest < ApplicationSystemTestCase
  setup do
    @gift = gifts(:one)
  end

  test "visiting the index" do
    visit gifts_url
    assert_selector "h1", text: "Gifts"
  end

  test "should create gift" do
    visit gifts_url
    click_on "New gift"

    fill_in "Image url", with: @gift.image_url
    fill_in "Name", with: @gift.name
    fill_in "Url", with: @gift.url
    click_on "Create Gift"

    assert_text "Gift was successfully created"
    click_on "Back"
  end

  test "should update Gift" do
    visit gift_url(@gift)
    click_on "Edit this gift", match: :first

    fill_in "Image url", with: @gift.image_url
    fill_in "Name", with: @gift.name
    fill_in "Url", with: @gift.url
    click_on "Update Gift"

    assert_text "Gift was successfully updated"
    click_on "Back"
  end

  test "should destroy Gift" do
    visit gift_url(@gift)
    click_on "Destroy this gift", match: :first

    assert_text "Gift was successfully destroyed"
  end
end
