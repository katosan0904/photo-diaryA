class RemoveImageFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :Image, :string
  end
end
