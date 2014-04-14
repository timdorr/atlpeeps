class AddCategoriesToUser < ActiveRecord::Migration
  def change
    add_column :users, :categories, :json
  end
end
