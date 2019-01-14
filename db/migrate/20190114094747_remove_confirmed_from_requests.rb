class RemoveConfirmedFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :confirmed
  end
end
