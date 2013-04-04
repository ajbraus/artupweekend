class CreateEmailSubscriptions < ActiveRecord::Migration
  def change
    create_table :email_subscriptions do |t|
      t.string :email
      t.string :name
      t.string :message
      t.string :phone
      t.boolean :newsletter

      t.timestamps
    end
  end
end
