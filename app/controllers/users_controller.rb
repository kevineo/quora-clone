get '/' do
  erb :"static/index"
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


post '/signup' do
	user = User.new(params[:user])
	user.password = params[:user][:password]
	if user.save
	session[:current_user_id] = user_id
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
		redirect '/success'
	else
		return false
	end

end

post '/logout' do
	#authentication when user logouts
	session[:user_id] = nil
end

