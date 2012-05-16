class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.string :login
      t.string :password
      t.string :user_id

      t.timestamps
    end
  end
end
