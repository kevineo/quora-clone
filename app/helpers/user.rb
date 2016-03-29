
helpers do
#this will return the current user, if they exist
#replace with code that works with your application

	def current_user
		@current_user ||= User.find_by(session[:current_user_id])
	end

#returns true if current_user exists, false otherwise

	def logged_in?
		!current_user.nil?
	end
end