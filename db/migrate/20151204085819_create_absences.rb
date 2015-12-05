class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.string :reason
      t.string :from_date
      t.string :to_date

      t.timestamps null: false
    end
  end
end
