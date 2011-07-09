Factory.define :friend do |u|
  u.name "test"
  u.email "test@test.com"
end

Factory.define :trusted_friend do |u|
  u.name "test"
  u.email "test@test.com"
  u.trust true
end