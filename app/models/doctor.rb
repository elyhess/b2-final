class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.names
    pluck(:name)
  end
end
