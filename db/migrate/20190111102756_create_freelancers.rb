class CreateFreelancers < ActiveRecord::Migration[5.2]
  def change
    create_table :freelancers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :bio

      t.timestamps
    end
  end
end
