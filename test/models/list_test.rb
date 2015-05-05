require 'test_helper'

class ListTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_uniqueness_of(:title).
    with_message("That list title has already been used.")
  should have_many(:items)
end
