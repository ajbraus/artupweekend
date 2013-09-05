class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :title
      t.references :event

      t.timestamps
    end
    add_index :prizes, :event_id
  end
end
