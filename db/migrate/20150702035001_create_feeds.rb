class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :link
      t.string :place
      t.string :address
      t.timestamp :started_at
      t.string :type, index: true

      t.timestamps null: false
    end
  end
end
