class Apdate < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :appoitmentdate, :datetime 
   
  end
end
