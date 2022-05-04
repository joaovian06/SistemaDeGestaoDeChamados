class AddAtendantToTreatments < ActiveRecord::Migration[5.2]
  def change
    add_reference :treatments, :atendant_id, foreign_key: { to_table: :users }
  end
end
