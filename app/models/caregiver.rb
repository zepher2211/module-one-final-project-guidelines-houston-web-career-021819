class Caregiver < ActiveRecord::Base
  has_many :parents, through: :positions
  has_many :applications
  has_many :positions, through: :applications
end
