class Treatment < ApplicationRecord
  belongs_to :user
  # belongs_to :atendant, class_name: "User"

  # belongs_to :consultant, inverse_of: :treatments
  # belongs_to :customer, inverse_of: :treatments

  enum treatment_type: [:password_reset, :software, :hardware_replacement, :hardware_setup, :misconnection, :user_setup, :user_remove ]
  enum status: [:open, :in_progress, :waiting, :done]

  validates_length_of :description, minimum: 20, on: :create

  validates_presence_of :treatment_type,
                        :title,
                        :description,
                        :user_id
end
