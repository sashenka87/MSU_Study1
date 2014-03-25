module AuthHelper
	def sign_in
	  @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
	end
end

RSpec.configure do |config|
  config.include AuthHelper, :type => :controller
end