class AddColumnToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :parent_id, :integer, index: true, null: true
    add_column :categories, :lft, :integer, index: true, null: false
    add_column :categories, :rgt, :integer, index: true, null: false
    add_column :categories, :depth, :integer, default: 0, null: false
    add_column :categories, :children_count, :integer, default: 0, null: false
  end

  def self.down
    remove_column :categories ,:parent_id
    remove_column :categories ,:lft
    remove_column :categories ,:rgt
    remove_column :categories ,:depth
    remove_column :categories ,:children_count
  end
end
