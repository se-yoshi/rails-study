FactoryGirl.define do
  factory :access_ticket do
    user nil
    authentication_token "MyString"
    expired_at "2015-01-01 00:00:00"
    available_times 1
  end
end
