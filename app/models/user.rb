class User < ApplicationRecord
  has_many :treatments, dependent: :destroy
  # has_one :treatment, foreign_key: 'atedant_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: [:student, :consultant]

  validates_presence_of :user_type,
                        :name
end
