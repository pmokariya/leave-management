class CreateUsersAbsences < ActiveRecord::Migration
  def change
    create_table :users_absences do |t|
      t.integer :user_id
      t.integer :absence_id
      t.boolean :is_approve, :default => false
      t.string  :status

      t.timestamps null: false
    end
  end
end
