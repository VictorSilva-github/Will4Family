class AddTitleValueToMessages < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :title, :string, default: 'Adicione o título'
  end
end
