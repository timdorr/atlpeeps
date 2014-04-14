class AddAtvToUsers < ActiveRecord::Migration
  def change
    add_column :users, :atv, :boolean


    remove_index :users, column: [:published, :approved]
    add_index :users, [:published, :approved, :atv]
  end
end
