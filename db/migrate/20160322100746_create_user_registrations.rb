class CreateUserRegistrations < ActiveRecord::Migration
  def change
    create_table :user_registrations do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :city
      t.string :description
      t.string :username
      t.string :password
      t.string :status

      t.timestamps null: false
    end
  end
end
