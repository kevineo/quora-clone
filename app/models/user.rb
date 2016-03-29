class User < ActiveRecord::Base
	has_secure_password
	# validates :email, format: {with: /[^@\s]+@[^@\s]+[.]+[^@\s]{2,}/i}
	# validates :password, length: {:minimum => 8 }
	validates :email, presence: true, uniqueness: true

	# users.password_hash in the database is a :string	

	def current_user
		if session[:current_user_id]
		@current_user ||= User.find_by(session[:current_user_id])
		end
	end


end


	# include BCrypt



	# def create
	# 	@user = User.new(params[:user])
	# 	@user.password = params[:password]
	# 	@user.save!
	# end

	# def login
	# 	@user = User.find_by_email(params[:email])
	# 	if @user.password == params[:password]
	# 		give_token
	# 	else
	# 		redirect_to home_url
	# 	end
	# end

	# # assign them a random one and mail it to them, asking them to change it
	# def forgot_password
	#   @user = User.find_by_email(params[:email])
	#   random_password = Array.new(10).map { (65 + rand(58)).chr }.join
	#   @user.password = random_password
	#   @user.save!
	#   Mailer.create_and_deliver_password_change(@user, random_password)
	# end
