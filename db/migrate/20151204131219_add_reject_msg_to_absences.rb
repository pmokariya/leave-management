class AddRejectMsgToAbsences < ActiveRecord::Migration
  def change
    add_column :absences, :reject_msg, :string
  end
end
