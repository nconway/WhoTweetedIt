class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all
		respond_with(@tweets)
	end

	def show
		respond_with(@tweet)
	end

	def new
		@tweet = Tweet.net
		respond_with(@tweet)
  	end

  	def create
    	@tweet = Tweet.new(tweet_params)
    	@tweet.user_id = current_user.id
    	@tweet.save
    	respond_with(@tweet)
  	end

  	def update
  		@tweet.update(tweet_params)
  		respond_with(@tweets)
  	end

  	def twitter_params
    	params.require(:tweet).permit(:message)
  	end

end
