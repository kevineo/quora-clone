class CreateQuestions < ActiveRecord::Migration 			
	def change	
		create_table :questions do |t|
			t.string :question
			t.string :description
			t.integer :user_id
			t.belongs_to :user, index: true
			t.timestamp
		end
	end


end