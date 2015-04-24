class TweetsController < ApplicationController

	def index
  	end

	def show
		
		#@friends_array = client.friends.name.to_a
		#binding.pry
		#puts "aaaaaaaaaaaaaaaaaaaaaaaaa"

		@win = 2

		client = current_user.twitter_client
		@friends = client.friends
		
		@name_list = Array.new
		@tweet_list = Array.new
		@hash_array = Array.new

		@friends.attrs[:users].each do |todo|
  			@name_list.push(todo[:name])
  			@tweet_list.push(todo[:status][:text])
  		end

  		#creates a hash from the two arrays
		@name_tweet_hash = Hash[@name_list.zip @tweet_list]

		@name_tweet_hash.each_pair do |one|
  			@hash_array << one
  		end
		
		#@hash_array.shuffle.pop[1]

	end
	
	

end
