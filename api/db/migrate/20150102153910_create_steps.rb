class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :description, null: false
      t.integer :order

      t.timestamps null: false
    end

    add_reference :steps, :recipe, index: true
  end
end
