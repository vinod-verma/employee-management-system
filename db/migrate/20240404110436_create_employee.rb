class CreateEmployee < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :department
      t.integer :salary

      t.timestamps
    end
  end
end
