class Answer < ActiveRecord::Base
	belongs_to :user
	attr_accessor :question_id
end