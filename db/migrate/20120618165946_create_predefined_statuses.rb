class CreatePredefinedStatuses < ActiveRecord::Migration
  def change
    create_table :predefined_statuses do |t|
      t.string :status
    end
  end
end
