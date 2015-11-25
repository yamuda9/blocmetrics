require 'rails_helper'

RSpec.describe User, type: :model do
  # Shoulda tests for email
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value("user@bloccit.com").for(:email) }
  it { should_not allow_value("userbloccit.com").for(:email) }

  # Shoulda tests for password
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(8) }

  describe "attributes" do
    it "should respond to email" do
      user = User.create!(email: "Joe@test.com", password: "password")
      expect(user).to respond_to(:email)
    end

    it "should respond to password" do
      user = User.create!(email: "Joe@test.com", password: "password")
      expect(user).to respond_to(:password)
    end
  end

  describe "invalid user" do
    it "should be an invalid user due to blank email" do
      user_with_blank_email = User.new(email: "", password: "password")
      expect(user_with_blank_email).to_not be_valid
    end
  end
end
