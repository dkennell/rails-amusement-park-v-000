class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  def change
  	create_table :users do |t|
  	  t.string :name
  	  t.string :password_digest
  	  t.integer :nausea, default: 0
  	  t.integer :happiness, default: 0
  	  t.integer :tickets, default: 0
  	  t.integer :height, default: 60
  	  t.boolean :admin, default: false
  	end
  end
end
