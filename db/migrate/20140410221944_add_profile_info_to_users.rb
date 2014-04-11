class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :image

    add_column :users, :website, :text
    add_column :users, :bio, :text

    add_column :users, :approved, :boolean, default: false
    add_column :users, :published, :boolean, default: false
  end
end
