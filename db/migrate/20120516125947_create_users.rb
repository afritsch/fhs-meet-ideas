class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fhsid
      t.string :firstname
      t.string :surname
      t.string :title
      t.string :email
      t.integer :isfemale
      t.integer :profile_visible
      t.string :type
      t.integer :is_admin
      t.text :description
      t.string :cached_slug
      t.string :avatar
      t.string :fullname

      t.timestamps
    end
  end
end
