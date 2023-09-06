class ChangeDescriptionInMessage < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :description, :text
  end
end
