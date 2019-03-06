class CreateParentTable < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do | table |
      table.string :username
      table.string :password
      table.string :name
    end
  end
end
