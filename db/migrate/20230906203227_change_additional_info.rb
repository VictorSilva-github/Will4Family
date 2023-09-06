class ChangeAdditionalInfo < ActiveRecord::Migration[7.0]
  def change
    change_column :receives, :additional_info, :text
  end
end
