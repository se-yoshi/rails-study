FactoryGirl.define do
  factory :user do
    login_name "user"
    password "password"
    after(:create) do |user|
      create(:user_attribute, user: user)
    end
  end
end
