class CleanupMigration < ActiveRecord::Migration
  def change
    remove_column :people, :provider
    remove_column :people, :uid
    remove_column :people, :name
    remove_column :users, :title
    remove_column :users, :isfemale
    remove_column :users, :profile_visible
    remove_column :users, :is_admin
    remove_column :users, :description
    remove_column :users, :cached_slug
    remove_column :users, :avatar
    remove_column :users, :fullname
  end
end
