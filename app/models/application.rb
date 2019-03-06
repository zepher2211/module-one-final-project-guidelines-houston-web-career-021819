class Application < ActiveRecord::Base
  belongs_to :caregiver
  belongs_to :position
end
