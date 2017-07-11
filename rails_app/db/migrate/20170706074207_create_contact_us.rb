class CreateContactUs < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_us do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :mobile_no, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
