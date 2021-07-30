FactoryBot.define do
  factory :task do
    description { "John to change name to Paul" }
    status { :backlog }
  end
end