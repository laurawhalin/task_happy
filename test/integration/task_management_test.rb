require 'test_helper'

class TaskManagementTest < ActionDispatch::IntegrationTest

  test "a list displays items on the index page" do
    list = create(:list)
    list.tasks << create_list(:task, 3)
    visit root_url
    assert page.has_css?("input[type=checkbox]", count: 3)
  end

  test "can crete a new task" do
    create(:list, title: "Parts of Body for Tattoo")
    visit root_url

    click_link("add task")
    fill_in("task[title]", with: "Shoulder")
    click_button("add")

    tomorrow = Date.tomorrow
    assert page.has_content?("Shoulder")
    assert page.has_content?(tomorrow)
    assert page.has_link?("add task")
    assert page.has_link?("delete")
    assert page.has_link?("edit")
  end

  test "can delete a task" do
    list = create(:list)
    list.tasks << create(:task)
    visit root_url

    click_link("delete")
    refute page.has_content?("Do this thing 1")
  end

  test "can update the properties of a task" do
    list = create(:list)
    list.tasks << create(:task)
    visit root_url

    click_link("edit")
    fill_in("task[title]", with: "Try not to code like a fool")
    click_button("update task")

    assert page.has_content?("Try not to code like a fool")
    refute page.has_content?("Do this thing 1")
  end

  test "checking a task removes it from the incomplete list" do
    list = create(:list)
    list.tasks << create(:task)
    visit root_url

    find(:css, "#task_status[value='1']").set(true)
    click_button("update")

    assert_equal "complete", list.tasks.first.status
    refute page.has_content?("Do this thing 1")
  end
end
