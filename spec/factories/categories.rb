FactoryBot.define do
  factory :category do
    title "awesome idea"
    # sequence(:title) {|n|"awesome idea#{n}"}
  end
end
