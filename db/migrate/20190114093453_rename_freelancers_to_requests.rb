class RenameFreelancersToRequests < ActiveRecord::Migration[5.2]
  def change
    rename_table :freelancers, :requests
  end
end
