class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name,       null: false
      t.string :description
      t.float  :amount
      t.string :unit

      t.timestamp null: false
    end

    add_reference :ingredients, :recipe, index: true
  end
end
