FactoryBot.define do
  factory(:user) do
    email { "ed@example.com" }
    password { "SecretPassword123" }
  end
end