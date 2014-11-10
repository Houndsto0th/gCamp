require 'rails_helper'


feature 'sign in' do

  scenario 'user signs in with valid information' do
    User.create!(
      first_name: 'Felix',
      last_name: 'Tester',
      email: 'felix@me.com',
      password: 'test',
      password_confirmation: 'test'
      )

    visit signin_path
    fill_in :email, with: 'felix@me.com'
    fill_in :password, with: 'test'
    click_on 'Sign in'
    expect(page).to have_content("Felix Tester")

  end

  scenario 'user signs in with blank fields' do
    User.create!(
      first_name: 'Felix',
      last_name: 'Tester',
      email: 'felix@me.com',
      password: 'test',
      password_confirmation: 'test'
      )

    visit signin_path
    click_on 'Sign in'
    expect(page).to have_content("invalid")
  end


end



feature 'signout' do

  scenario 'user signs out after signing in' do
    User.create!(
      first_name: 'Felix',
      last_name: 'Tester',
      email: 'felix@me.com',
      password: 'test',
      password_confirmation: 'test'
      )

    visit signin_path
    fill_in :email, with: 'felix@me.com'
    fill_in :password, with: 'test'
    click_on 'Sign in'
    expect(page).to have_content("Felix Tester")
    click_on 'Sign Out'
    expect(page).to have_content("Sign In")


  end

end



feature 'signup' do
  scenario 'user signs up with valid information' do

    visit root_path
    click_on 'Sign Up'
    expect(page).to have_content('Sign up for gCamp!')
    fill_in 'First name', with: 'Felix'
    fill_in 'Last name', with: 'Tester'
    fill_in 'Email', with: 'Felix@Testing.com'
    fill_in 'Password', with: 'test'
    fill_in 'Password confirmation', with: 'test'
    click_on 'Sign up'
    expect(page).to have_content("Your Life, Organized")

  end

  scenario 'user signs up with invalid information' do

    visit root_path
    click_on 'Sign Up'
    expect(page).to have_content('Sign up for gCamp!')
    fill_in 'First name', with: 'Felix'
    fill_in 'Last name', with: 'Tester'
    fill_in 'Email', with: 'FelixTesting.com'
    fill_in 'Password', with: 'test'
    fill_in 'Password confirmation', with: 'test'
    click_on 'Sign up'
    expect(page).to have_content("invalid")

  end

  scenario 'user signs up with blank information' do

    visit root_path
    click_on 'Sign Up'
    expect(page).to have_content('Sign up for gCamp!')
    click_on 'Sign up'
    expect(page).to have_content("can't be blank")

  end


end
