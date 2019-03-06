class CreateApplicationTable < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do | table |
      table.string :content
      table.belongs_to :caregiver
      table.belongs_to :position
    end
  end
end
