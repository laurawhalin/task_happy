require 'test_helper'

class ListManagementTest < ActionDispatch::IntegrationTest

  test "can view an empty list" do
    list = create(:list)
    visit root_url

    assert page.has_content?("List 1")
    assert_equal [], list.tasks.all
  end

  test "a list displays items on the index" do
    skip
    list = create(:list)
    list.tasks << create_list(:task, 3)
    visit root_url

    # assert page.has_unchecked_field?("#task_status", count: 5)
    assert page.has_css?("#task_status", count: 5)
  end

  test "can view all lists on the index" do
    create_list(:list, 2)
    visit root_url

    page.assert_selector("#list", count: 2)
    assert page.has_content?("List 1")
    assert page.has_content?("List 2")
  end

  test "can crete a new list" do
    visit root_url

    click_link("create new list")
    fill_in("list[title]", with: "Parts of Body for Tattoo")
    click_button("create list")

    assert page.has_content?("Parts of Body for Tattoo")
    assert page.has_button?("add task")
    assert page.has_link?("delete list")
    assert page.has_link?("update title")
    assert page.has_link?("archive list")
  end

  test "can delete a list" do
    create(:list)
    visit root_url

    click_link("delete list")
    refute page.has_content?("List 1")
  end

  test "can update the title of a list" do
    create(:list)
    visit root_url

    click_link("update title")
    fill_in("list[title]", with: "Animals to feed at the zoo")
    click_button("update title")

    assert page.has_content?("Animals to feed at the zoo")
    refute page.has_content?("List 1")
  end

  test "can archive a list" do
    create(:list)
    visit root_url

    click_link("archive list")
    refute page.has_content?("List 1")

    click_link("view archived lists")
    assert_equal archived_lists_path, current_path
    assert page.has_content?("List 1")
  end

  test "can view all archived lists on another page" do

  end

end
