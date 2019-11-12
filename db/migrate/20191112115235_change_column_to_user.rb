class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :place, :string
  end
end
