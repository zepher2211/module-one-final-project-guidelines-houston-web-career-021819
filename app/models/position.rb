class Position < ActiveRecord::Base
  belongs_to :parent
  has_many :applications
  has_many :applicants, through: :applications, source: :caregiver
  belongs_to :caregiver
end
