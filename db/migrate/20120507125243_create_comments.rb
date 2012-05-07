class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :project_id
      t.integer :person_id
      t.text :content
      t.datetime :date

      t.timestamps
    end
  end
end
