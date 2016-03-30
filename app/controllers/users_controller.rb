get '/' do
	if logged_in?
		redirect '/users/:id'
	else
  	erb :"static/index"
  end
end

get '/signup' do
  erb :"/signup"
end

get '/login' do
	erb :"/login"
end

get '/success' do
	erb :"/success"
end

get '/users/:id' do
	erb :"static/profile"
end



post '/signup' do
	user = User.new(params[:user])
	# user.name = params[:user][:name]
	# user.password = params[:user][:password]
	if user.save
	session[:current_user_id] = user.id
	flash[:notice] = "You signed up successfully"
    flash[:color] = "valid"
    redirect '/success'
		#what should happen if user saves
	else
		#what happens if the user keyed invalid date?
	 flash[:notice] = "Form is invalid"
     flash[:color]= "invalid"
     redirect '/signup'
	end
end

post '/login' do
	#authentication when user logins
	user = User.find_by(email: params[:user][:email])
	if user.authenticate(params[:user][:password])
		session[:current_user_id] = user.id
		redirect '/users/:id'
	else
		redirect '/signup'
	end

end

post '/logout' do
	#authentication when user logouts
	session[:current_user_id] = nil
	redirect '/login'
end

post '/users/:id' do
	erb :"static/profile"
end



