class AddCategoryToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :category, foreign_key: true
  end
end
