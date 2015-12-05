class AddStatusToUsersAbsence < ActiveRecord::Migration
  def change
    add_column :users_absences, :status, :string
  end
end
