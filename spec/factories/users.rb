FactoryBot.define do
  sequence(:email) { |n| "email-#{n}@test.com" }

  factory :base_user, class: User do
    email
    password { 'a password' }
    password_confirmation { 'a password' }

    factory :user do
      after(:create) { |user| user.remove_role(:admin) }
    end

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :superadmin do
      after(:create) { |user| user.add_role(:superadmin) }
    end
  end
end
