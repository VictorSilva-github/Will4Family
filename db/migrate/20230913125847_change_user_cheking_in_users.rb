class ChangeUserChekingInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_cheking, :checkin_days
  end
end
