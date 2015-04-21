class Tweet < ActiveRecord::Base
	belongs_to :user

	def post_to_twitter
		user.twitter.update(body)
	end

end
