# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ranking do
    stance_id 1
    category 1
    useful_ranking 1
    useful_justification "MyString"
    trustworthy_ranking 1
    trustworthy_justification "MyString"
    accurate_ranking 1
    accurate_justification "MyString"
    interesting_ranking 1
    interesting_justification "MyString"
  end
end
