class TweetsController < ApplicationController

	def index
  	end

	def show
		client = current_user.twitter_client
		@friends = client.friends
		#@friends_array = client.friends.name.to_a

		#binding.pry
		#puts "aaaaaaaaaaaaaaaaaaaaaaaaa"
	end

end
