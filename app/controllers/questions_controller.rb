get '/question' do
	erb :"static/question"
end

get '/all_questions' do
	erb :"static/all_questions"
end


post '/question' do
	question = Question.new(params[:question])
	question.user_id = current_user.id
	if question.save
		redirect '/success'
	else
		redirect '/question' 
	end
end