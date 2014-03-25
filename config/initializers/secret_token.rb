# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
MultipleSourceUse::Application.config.secret_key_base = ENV["SECRET_KEY"] || 'e1d601186187aea62cfe8bfe5e0f536588b05cf7f936c8d175c42986e5cc63009c0df469eed00a85acc6acf576777be0bce690df71cf9dee80de10ded2416ea2'
