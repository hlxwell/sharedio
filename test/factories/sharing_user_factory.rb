Factory.define :sharing_user do |f|
  f.association :sharing, :factory => :sharing
  f.association :friend, :factory => :friend
end