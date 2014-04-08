class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true
      t.string :provider
      t.text :uid
      t.text :info
      t.text :extra

      t.timestamps
    end
  end
end
