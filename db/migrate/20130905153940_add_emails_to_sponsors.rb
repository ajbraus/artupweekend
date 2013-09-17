class AddEmailsToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :email, :string
  end
end
