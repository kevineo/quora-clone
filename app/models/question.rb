class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	attr_accessor :question_id

	def current_question
		if session[:current_question_id]
		@current_question ||= Question.find_by(session[:question_user_id])
		end
	end

end