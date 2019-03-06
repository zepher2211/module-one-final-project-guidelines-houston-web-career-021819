class Parent < ActiveRecord::Base
  has_many :caregivers, through: :positions
  has_many :positions
end
