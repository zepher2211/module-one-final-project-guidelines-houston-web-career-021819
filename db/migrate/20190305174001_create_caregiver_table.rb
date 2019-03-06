class CreateCaregiverTable < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers do | table |
      table.string :username
      table.string :password
      table.string :name
      table.integer :years_of_experience 
    end
  end
end
