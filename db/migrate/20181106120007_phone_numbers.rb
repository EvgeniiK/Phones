class PhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.integer :first_part
      t.integer :second_part
      t.integer :third_part

      t.timestamps
    end
    add_index :phone_numbers, :first_part
    add_index :phone_numbers, :second_part
    add_index :phone_numbers, :third_part
  end
end
