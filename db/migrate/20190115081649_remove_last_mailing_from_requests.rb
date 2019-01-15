class RemoveLastMailingFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :last_mailing
  end
end
