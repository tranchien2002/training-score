class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :code, null: false, default: ""
      t.string :password_digest, null: false, default: ""
      t.integer :role
      t.string  :name

      t.timestamps
    end
  end
end
