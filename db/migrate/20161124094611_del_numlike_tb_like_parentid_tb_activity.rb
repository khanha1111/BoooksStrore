class DelNumlikeTbLikeParentidTbActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :parent_id
    remove_column :likes, :num_like
  end
end
