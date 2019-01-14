class AddKeyToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :key, :string
  end
end
