class AddExpiredToWaitingLists < ActiveRecord::Migration[5.2]
  def change
    add_column :waiting_lists, :expired, :boolean
  end
end
