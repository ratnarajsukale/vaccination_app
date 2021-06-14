FactoryBot.define do
  factory :booking do
    date  {DateTime.now + 1.week}
    association :user, :factory => :user
    association :hospital, :factory => :hospital
    
  end
end
