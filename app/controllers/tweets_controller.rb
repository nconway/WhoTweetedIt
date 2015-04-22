class TweetsController < ApplicationController

	def index
  	end

	def show
		client = current_user.twitter_client.friends
		#friends = client.friend
		binding.pry
		puts "aaaaaaaaaaaaaaaaaaaaaaaaa"
	end

end
