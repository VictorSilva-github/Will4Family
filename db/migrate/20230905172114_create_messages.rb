class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :message_type
      t.string :description
      t.string :user_cheking
      t.date :last_checking_at
      t.string :tolerance_days
      t.date :ultimate_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
