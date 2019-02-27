class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  def whole_name
    "#{self.doctor_fname} #{self.doctor_lname}"
  end 
end
