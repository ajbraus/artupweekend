class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :url
      t.references :event

      t.timestamps
    end
    add_index :sponsors, :event_id
  end
end
