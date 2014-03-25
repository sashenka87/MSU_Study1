FactoryGirl.define do
  sequence(:email) {|n| "person-#{n}@example.com" }
  sequence(:username) {|n| "user#{n}"}
  sequence(:name) {|n| "name#{n}"}
end