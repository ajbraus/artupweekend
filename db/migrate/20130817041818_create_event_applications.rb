class CreateEventApplications < ActiveRecord::Migration
  def change
    create_table :event_applications do |t|
      t.string :where
      t.text :why
      t.text :who
      t.text :contributions
      t.string :heard_of_us
      t.text :goals
      t.string :venue
      t.references :user

      t.timestamps
    end
    add_index :event_applications, :user_id
  end
end
