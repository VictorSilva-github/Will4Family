class RemoveDefaultValueFromTitle < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :title, :string, default: ''
  end
end
