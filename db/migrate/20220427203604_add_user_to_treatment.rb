class AddUserToTreatment < ActiveRecord::Migration[5.2]
  def change
    add_reference :treatments, :user, foreign_key: true
  end
end
