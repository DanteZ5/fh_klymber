class AddConfirmedToFreelancers < ActiveRecord::Migration[5.2]
  def change
    add_column :freelancers, :confirmed, :boolean
  end
end
