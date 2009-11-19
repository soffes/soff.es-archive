Less::More.header = false

if Rails.env.to_sym == :production
  Less::More.compression = true
end
