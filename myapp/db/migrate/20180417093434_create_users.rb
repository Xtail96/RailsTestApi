class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :mickname, :unique => true
      t.string :email, :unique => true
      t.string :password
      t.timestamps
    end
  end
end
