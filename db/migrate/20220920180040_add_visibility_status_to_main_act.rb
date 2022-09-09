class AddVisibilityStatusToMainAct < ActiveRecord::Migration[6.1]
  def change
    add_column :main_acts, :is_open, :boolean, default: true
  end
end
