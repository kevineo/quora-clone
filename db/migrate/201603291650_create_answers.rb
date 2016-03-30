class CreateAnswers < ActiveRecord::Migration 			
	def change	
		create_table :answers do |t|
			t.string :answer
			t.integer :user_id
			t.integer :question_id
			t.belongs_to :question, index: true
			t.timestamp
		end
	end
end