class ChangeColumnToPost < ActiveRecord::Migration[5.0]
  def change
    change_column_null :Posts, :image, null: false
    change_column_null :Posts, :category_id, null: false
  end
end
