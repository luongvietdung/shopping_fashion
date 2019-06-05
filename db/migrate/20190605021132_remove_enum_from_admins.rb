class RemoveEnumFromAdmins < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :enum, :integer
  end
end
