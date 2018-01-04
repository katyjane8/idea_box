include ActionDispatch::TestProcess
FactoryBot.define do
  factory :image do
    url { fixture_file_upload(Rails.root.join('app', 'assets', 'images', '3.png'), 'image/png') }
  end
end
