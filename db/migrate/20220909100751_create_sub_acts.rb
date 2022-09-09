class CreateSubActs < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_acts, id: :uuid do |t|
      t.belongs_to :main_act, type: :uuid, index: true
      t.string :name

      t.jsonb :metadata
      
      t.timestamps
    end
  end
end
