class AddIndexesToUsers < ActiveRecord::Migration
  def change
    add_index :users, [:published, :approved]
  end
end
