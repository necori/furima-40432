class AddReadLastToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :read_last, :string
  end
end
