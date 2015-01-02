class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
    end

    add_reference :recipes, :user, index: true
  end
end
