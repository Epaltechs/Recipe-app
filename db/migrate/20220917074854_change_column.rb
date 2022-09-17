class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :public, :boolean
    add_column :recipes, :public, :string
  end
end
