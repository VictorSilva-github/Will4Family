class UpdateColumnToMessages < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :message_type, 'integer USING CAST(message_type AS integer)'
  end
end
