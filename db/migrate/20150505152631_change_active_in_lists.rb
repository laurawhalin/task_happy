class ChangeActiveInLists < ActiveRecord::Migration
  def change
    change_column :lists, :active, :boolean, default: true
  end
end
