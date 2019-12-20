class ChangeColumnToPost < ActiveRecord::Migration[5.0]
  def change
    change_column_null :posts, :image, null: false
    change_column_null :posts, :category_id, null: false
  end
end
