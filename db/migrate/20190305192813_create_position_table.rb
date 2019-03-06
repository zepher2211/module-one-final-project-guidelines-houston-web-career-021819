class CreatePositionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do | table |
    table.string :title
    table.string :requirements
    table.string :duration
    table.string :working_hours
    table.string :compensation
    table.boolean :position_filled
    table.integer :star_rating
    table.string :review
    table.belongs_to :parent
    table.belongs_to :caregiver
    end
  end
end
