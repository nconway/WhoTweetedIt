class SessionsController < ApplicationController

	def create
		#@user = User.find_or_create_from_auth_hash(auth_hash)
		auth = request.env["omniauth.auth"]
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.id
		#redirect_to root_url, :notice => "Signed in!" 
		redirect_to tweet_path(current_user)
	end

	#def show
	#	client = current_user.twitter_client
	#	friends = client.friend
	#	binding.pry
	#	puts "aaaaaaaaaaaaaaaaaaaaaaaaa"
	#end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Signed out!"
	end

end