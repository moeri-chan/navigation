class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :parent_id, :post_id
  end
end
