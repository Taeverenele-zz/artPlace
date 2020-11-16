class AddUserIdToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :user_id, :integer
  end
end
