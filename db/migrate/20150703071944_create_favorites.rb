class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, index: true
      t.references :feed

      t.timestamps null: false
    end
  end
end
