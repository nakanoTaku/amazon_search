# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
      :associate_tag =>     '0piyo0804-22',
      :AWS_access_key_id => ENV["AMAZON_KEY_ID"],
      :AWS_secret_key =>    ENV["AMAZON_SECRET_KEY"]
}
