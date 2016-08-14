class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :street
      t.string :state
      t.string :city
      t.string :neighborhood

      t.timestamps
    end
  end
end
