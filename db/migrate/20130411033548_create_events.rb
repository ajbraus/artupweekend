class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :starts_at
      t.string :img_url
      t.string :location

      t.timestamps
    end
  end
end
