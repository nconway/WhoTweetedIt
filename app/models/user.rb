class User < ActiveRecord::Base
	
	#def self.find_or_create_from_auth_hash(auth_hash)
	#	user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
	#	user.update(
	#		name: auth_hash.info.name,
	#		profile_image: auth_hash.info.image,
	#		token: auth_hash.credentials.token,
	#		secret: auth_hash.credentials.secret
	#	)
	#	user
	#end
	
	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
			user.token = auth["credentials"]["token"]
			user.secret = auth["credentials"]["secret"]
			user.profile_image = auth["info"]["image"]
		end
	end

	def twitter
		@client ||= Twitter::REST::Client.new do |config|
		  config.consumer_key        = "o66n2O0ub1HYwUkd1OVTJTnyM"
		  config.consumer_secret     = "LmrtcGLOkj4AnELWnHF6WhrNy3lv1btVGmSPYA10cvlTcx45iG"
		  config.access_token        = token
		  config.access_token_secret = secret
		end
	end

end
