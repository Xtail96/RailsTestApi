class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.belongs_to :user, index: true
      t.string :access_value, unique: true
      t.timestamps
    end
  end
end
