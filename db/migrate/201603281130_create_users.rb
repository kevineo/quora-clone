class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :name
			t.string :email
			t.string :password_digest, null:false
			t.timestamp
		end
	end
end
