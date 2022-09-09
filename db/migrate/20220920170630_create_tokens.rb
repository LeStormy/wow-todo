class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.belongs_to :user, type: :uuid, index: true

      t.boolean :active, default: true
      t.string :code

      t.string :telegram_id
      t.string :name

      t.timestamps
    end
  end
end
