class TweetsController < ApplicationController

	def index
  	end

	def show
		
		def rand_pair!
      		k,v = rand_pair
      		delete( k )
      		return k,v
    	end

		client = current_user.twitter_client
		@friends = client.friends
		#@friends_array = client.friends.name.to_a

		#binding.pry
		#puts "aaaaaaaaaaaaaaaaaaaaaaaaa"

		@name_list = Array.new
		@tweet_list = Array.new

		@friends.attrs[:users].each do |todo|
  			@name_list.push(todo[:name])
  			@tweet_list.push(todo[:status][:text])

  		#creates a hash from the two arrays
		@name_tweet_hash = Hash[@name_list.zip @tweet_list]
		
		#@display_tweet = @name_tweet_hash.rand_pair!

		end


	end
	
	

end
