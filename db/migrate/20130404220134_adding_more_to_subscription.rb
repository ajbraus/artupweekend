class AddingMoreToSubscription < ActiveRecord::Migration
  def change
    add_column, :email_subscriptions, :name, :string
    add_column, :email_subscriptions, :message, :string
    add_column, :email_subscriptions, :phone, :string
    add_column, :email_subscriptions, :newsletter, :boolean
  end
end
