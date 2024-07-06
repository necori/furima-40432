class AddReadFirstToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :read_first, :string
  end
end
