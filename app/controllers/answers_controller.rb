get '/answers' do
	erb :"static/profile"
end

post '/answer' do
	answer = Answer.new(params[:answer])
	answer.user_id = current_user.id
	if answer.save
		redirect '/success'
	else
		redirect '/all_questions'
	end
end


