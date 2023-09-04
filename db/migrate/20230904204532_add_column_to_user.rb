class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :document_type, :string
    add_column :users, :document_number, :string
    add_column :users, :phone_number, :string
    add_column :users, :post_code, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
