class RenameAppointmentInDate < ActiveRecord::Migration
  def change
    rename_column :appointments, :appointment, :date
  end
end
