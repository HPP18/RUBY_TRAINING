class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :user_type
      t.integer :phone
      t.string :address
      t.date :dob

      t.timestamps
    end
  end
end