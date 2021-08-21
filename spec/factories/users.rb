FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000aaaa'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'聡'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'サトシ'}
    birthday              {'1930-01-01'}
  end
end