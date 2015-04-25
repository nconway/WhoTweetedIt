class TweetsController < ApplicationController

	def index
  	end

	def show
		@result = show_friends
		@win = 2	
	end

	def guess

		@guess = params[:guess]['friends_list']

		@result = show_friends
		render 'show'
	end 

	def show_friends

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

		#makes an array of key-value pair array
		@name_tweet_hash.each_pair do |one|
  			@hash_array << one
  		end
  		result ={'name_list'=>@name_list,'hash_array'=>@hash_array,'friends'=>@friends}

	end 
	
	def safe_params
		params.require(:guess).permit(:friends_list)
	end

end
