class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :doctor_fname
      t.string :doctor_lname

      t.timestamps
    end
  end
end
