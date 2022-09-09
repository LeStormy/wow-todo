class CreateCompletions < ActiveRecord::Migration[6.1]
  def change
    create_table :completions, id: :uuid do |t|
      t.belongs_to :sub_act, type: :uuid

      t.timestamps
    end
  end
end
