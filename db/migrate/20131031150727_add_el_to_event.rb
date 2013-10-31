class AddElToEvent < ActiveRecord::Migration
  def change
    add_column :events, :twitter_handle, :string
    add_column :events, :facebook_page_url, :string
    add_column :events, :tickets_url, :string
  end
end
