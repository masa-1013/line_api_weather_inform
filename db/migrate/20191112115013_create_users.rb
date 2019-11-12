class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :token, null: false
      t.integer :place

      t.timestamps
    end
  end
end
