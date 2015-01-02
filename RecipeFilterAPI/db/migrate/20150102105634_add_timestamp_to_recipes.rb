class AddTimestampToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :created_at, :datetime
    add_column :recipes, :updated_at, :datetime
  end
end
