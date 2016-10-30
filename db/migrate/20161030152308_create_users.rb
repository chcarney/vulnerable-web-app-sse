class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
      t.string :password_md5
      t.string :password_plain
      t.timestamp :confirmed_at

      t.timestamps null: false
    end
  end
end
