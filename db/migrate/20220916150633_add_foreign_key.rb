class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :recipe, foreign_key: :true, on_delete: :cascade
    add_reference :recipe_foods, :food, foreign_key: :true, on_delete: :cascade
  end
end
