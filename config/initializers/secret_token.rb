# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#NewtechBlog::Application.config.secret_key_base = '2e1d1758880e3bbea2f93898296baa2bb3dc5efea40da3a0b268b81161e62975b7cfb3fe698d206236e56d51a825ae6b565684bd4f46460a99620d499e5d5f37'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

NewtechBlog::Application.config.secret_key_base = secure_token