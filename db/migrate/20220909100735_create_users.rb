class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :telegram_username
      t.integer :telegram_id

      t.timestamps
    end
  end
end
