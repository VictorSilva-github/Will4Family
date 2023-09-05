class CreateReceives < ActiveRecord::Migration[7.0]
  def change
    create_table :receives do |t|
      t.string :name
      t.string :email
      t.string :relationship
      t.string :phone_number
      t.string :additional_info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
