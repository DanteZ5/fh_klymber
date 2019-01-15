class CreateWaitingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :waiting_lists do |t|
      t.references :request, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
