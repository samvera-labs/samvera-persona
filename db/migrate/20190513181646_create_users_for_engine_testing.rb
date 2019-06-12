class CreateUsersForEngineTesting < ActiveRecord::Migration[5.0]
  def change
    unless table_exists? :users
      create_table :users do |t|
        t.string :email
        t.string :password
        t.string :password_confirmation

        t.timestamps
      end
    end
  end
end
