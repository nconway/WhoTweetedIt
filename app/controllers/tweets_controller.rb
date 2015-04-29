class TweetsController < ApplicationController

	def index
  	end

	def show

		#if params[:state]
		#	@state = params[:guess]
		#else
		#	@state = 0
		#end
		
		@state = 1

		if @state == 1
			@result = show_friends
			@current_kv = @result['hash_array'].shuffle.pop
			@current_tweet = @current_kv[1]
			@current_friend = @current_kv[0]
			@state = 1
		end
		current_state ={'current_kv'=>@current_kv,'current_tweet'=>@current_tweet,'current_friend'=>@current_friend, 'state'=>@state}
	end

	def again
		@again = params[:again]
		@result = show_friends
		@current_state = show
		@state = 1
		
		render 'show'
	end

	def guess

		#@freind = params[:current_friend]
		
		@guess = params[:guess]['friends_list']
		@state = params[:guess]['state']	
		@answer = params[:guess]['current_friend']	
		@current_state = show
		
		if @guess == @answer
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
		params.permit(:guess, :friends_list, :again, :state, :current_friend)
	end

end