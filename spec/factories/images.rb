FactoryBot.define do
  factory :image do
    image { fixture_file_upload(Rails.root.join('spec/fixtures/2.jpg'), 'image/jpg') }
  end
end
