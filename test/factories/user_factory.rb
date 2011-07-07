Factory.define :user do |u|
  u.sequence(:email) { |n| "user#{n}@example.com" }
  u.password "password"
end


# Factory.define :confirmed_user, :parent => :user do |u|
#   u.after_build {|user| user.skip_confirmation! }
# end
# 
# Factory.define(:invitation) do |i|
#   i.sequence(:firstname) { |n| "Mr. #{n}" }
#   i.sequence(:lastname) { |n| "#{n}" }
#   i.sequence(:email) { |n| "invitation#{n}@example.com" }
#   i.sequence(:company) { |n| "example.com" }
#   i.sequence(:sponsor) { |n| "ASICS" }
# end
