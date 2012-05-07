class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :project_id
      t.text :description
      t.datetime :appointment

      t.timestamps
    end
  end
end
