class AddFufilledToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :fufilled, :boolean, default: false
  end
end
