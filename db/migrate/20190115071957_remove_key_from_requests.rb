class RemoveKeyFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :key
  end
end
