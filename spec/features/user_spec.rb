require 'rails_helper'
RSpec.describe 'User', type: :feature do
  scenario 'signing up user with correct credentials', js: true do
    visit new_user_path
    fill_in 'User name', with: 'Emmanuel'
    fill_in 'Email', with: 'emmanuel@gmail.com'
    click_on 'signup'
    expect(page).to have_content('Welcome to the the course tracker')
  end

  scenario 'signingup user with incorrect credentials', js: true do
    visit new_user_path
    fill_in 'Email', with: 'emmanuel@gmail.com'
    click_on 'signup'
    expect(page).to have_content('Log In')
  end

  scenario 'logging in user', js: true do
    visit new_user_path
    fill_in 'User name', with: 'Emmanuel'
    fill_in 'Email', with: 'emmanuel@gmail.com'
    click_on 'signup'
    visit login_path
    fill_in 'User name', with: 'Emmanuel'
    click_on 'Login'
    expect(page).to have_content('External projects')
  end

  scenario 'logging in with incorrect credentials', js: true do
    visit login_path
    fill_in 'User name', with: 'Emmanuelll'
    click_on 'Login'
    expect(page).to have_content('Sign Up')
  end

  scenario 'logging out a user', js: true do
    visit new_user_path
    fill_in 'User name', with: 'Emmanuel'
    fill_in 'Email', with: 'emmanuel@gmail.com'
    click_on 'signup'
    visit login_path
    fill_in 'User name', with: 'Emmanuel'
    click_on 'Login'
    click_link 'External projects'
    click_link 'Add Project'
    click_link 'Log out'
    expect(page).to have_content('Sign Up')
  end
end
