class TweetsController < ApplicationController

	def index
  	end

	def show
		@result = show_friends
		@guess
		@state = 1
		@count = 0
		@current_tweet
		@current_friend
		
		if @state == 1 
			@current_kv = @result['hash_array'].shuffle.pop
			@current_tweet = @current_kv[1]
			@current_friend = @current_kv[0]
			@count = @count + 1
		end
		
		current_state ={'count'=>@count, 'current_kv'=>@current_kv,'current_tweet'=>@current_tweet,'current_friend'=>@current_friend, 'state'=>@state}
	end

	def again
		@again = params[:again]
		@result = show_friends
		@current_state = show
		@state = 1
		@current_tweet
		@current_friend
		
		
		render 'show'
	end

	def guess

		@guess = params[:guess]['friends_list']
		@result = show_friends
		@current_state = show
		@current_friend
		@current_tweet
		
		if @guess == @current_friend
			@state = 2
		else 
			@state = 3
		end
	
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
		params.permit(:guess, :friends_list, :again)
	end

end
