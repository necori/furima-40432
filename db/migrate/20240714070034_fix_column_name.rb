class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :deration_id, :duration_id
  end
end