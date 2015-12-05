class AddManagerIdToAbsences < ActiveRecord::Migration
  def change
    add_column :absences, :manager_id, :integer
  end
end
