class AddIndexToFavorite < ActiveRecord::Migration
  def change
    add_index :favorites, :feed_id
  end
end
