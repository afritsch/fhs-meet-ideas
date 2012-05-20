class ChangePicturesTable < ActiveRecord::Migration
  def change
    rename_column :pictures, :path, :image
    add_column :pictures, :title, :string
  end
end
