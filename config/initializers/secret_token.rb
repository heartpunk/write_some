# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
not_so_secret_key = '300ff30c3f2637e5551e8df2cb4684c6fdf1cc1c375227f96770ca38f67889dd66f45294152b31c3c603d7548dbd86d6869df7eb1c49442a792004a17fb6abee'
WriteSome::Application.config.secret_key_base = if ENV['WRITE_SOME_SECRET_KEY'].is_a?(String) and
                                                   ENV['WRITE_SOME_SECRET_KEY'].length > 30 and
                                                   ENV['WRITE_SOME_SECRET_KEY'] !~ /#{not_so_secret_key}/
  ENV['WRITE_SOME_SECRET_KEY']
else
  $UNSAFE_SECRET_KEY = true
  not_so_secret_key
end
