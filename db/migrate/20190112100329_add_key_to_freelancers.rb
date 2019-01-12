class AddKeyToFreelancers < ActiveRecord::Migration[5.2]
  def change
    add_column :freelancers, :key, :string
  end
end
