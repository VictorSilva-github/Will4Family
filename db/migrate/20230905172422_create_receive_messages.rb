class CreateReceiveMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :receive_messages do |t|
      t.references :message, null: false, foreign_key: true
      t.references :receive, null: false, foreign_key: true

      t.timestamps
    end
  end
end
