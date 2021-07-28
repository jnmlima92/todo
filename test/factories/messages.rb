FactoryBot.define do
  factory :message do
    description { "John to change name to Paul" }
    hexadecimal_color { "#0F5417" }
    message_type { :success }
  end
end