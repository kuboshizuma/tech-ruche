class AddIndexToFeed < ActiveRecord::Migration
  def change
    add_index :feeds, :link
  end
end
