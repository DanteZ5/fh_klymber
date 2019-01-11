class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :freelancer, foreign_key: true
      t.string :status
      t.date :last_mailing

      t.timestamps
    end
  end
end
