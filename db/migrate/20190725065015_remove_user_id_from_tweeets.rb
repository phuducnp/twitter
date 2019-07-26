class RemoveUserIdFromTweeets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweeets, :user_id, :integer
  end
end
