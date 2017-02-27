class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :email
      t.string :contact_person
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
