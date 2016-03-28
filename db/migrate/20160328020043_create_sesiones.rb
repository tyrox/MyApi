class CreateSesiones < ActiveRecord::Migration
  def change
    create_table :sesiones do |t|
      t.integer :user_id
      t.string :token_auth

      t.timestamps null: false
    end
  end
end
