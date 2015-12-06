class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.string :reason
      t.string :date
      t.string :manager_id
      t.string :reject_msg

      t.timestamps null: false
    end
  end
end
