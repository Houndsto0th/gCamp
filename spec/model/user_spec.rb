require 'rails_helper'

describe 'User' do
  it 'validates the email of a user' do
    original = create_user

    user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: original.email,
        password_digest: Faker::Internet.password,)
    user.valid?
    expect(user.errors[:email].present?).to eq(true)


  end
end
