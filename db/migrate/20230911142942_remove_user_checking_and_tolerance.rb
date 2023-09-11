class RemoveUserCheckingAndTolerance < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :user_cheking, :string
    remove_column :messages, :tolerance_days, :string
    add_column :messages, :sent, :boolean, default: false
    change_column :messages, :title, :string, default: 'Add a title'
    remove_column :messages, :last_checking_at
  end
end
