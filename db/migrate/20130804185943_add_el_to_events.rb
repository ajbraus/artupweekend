class AddElToEvents < ActiveRecord::Migration
  def change
    add_column :events, :campaign_url, :string
    add_column :events, :video_url, :string
  end
end
