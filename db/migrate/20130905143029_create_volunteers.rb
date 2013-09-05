class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.integer :event_id
      t.integer :teammate_id
      t.boolean :organizer, default: false

      t.timestamps
    end
  end
end
