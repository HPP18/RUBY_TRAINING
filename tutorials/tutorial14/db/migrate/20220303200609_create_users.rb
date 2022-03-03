class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, index: { unique: true, name: 'unique_emails' }""
      t.string :password

      t.timestamps
    end
  end
end
