# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Cms::Application.config.secret_key_base = '0e7f787aa9b18f3871b429de093ff0a1d0ffa569fd633358a41b4a52a0630a64cec272e175c53d8c88ec5f115b284b84fca0e01db2736be585c84d9b5d6827ea'
