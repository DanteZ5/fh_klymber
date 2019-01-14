class AddLastMailingToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :last_mailing, :date
  end
end
