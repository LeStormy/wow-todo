class CreateMainActs < ActiveRecord::Migration[6.1]
  def change
    create_table :main_acts, id: :uuid do |t|
      t.belongs_to :user, type: :uuid, index: true
      t.string :name
      
      t.timestamps
    end
  end
end
