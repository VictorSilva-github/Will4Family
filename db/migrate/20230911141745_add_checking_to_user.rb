class AddCheckingToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_cheking, :integer
    add_column :users, :tolerance_days, :integer
    add_column :users, :last_checking_at, :date
  end
end
