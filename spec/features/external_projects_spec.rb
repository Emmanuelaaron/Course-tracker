require 'rails_helper'
RSpec.describe 'External projects', type: :feature do
  scenario 'creating a project user', js: true do
    visit new_user_path
    fill_in 'User name', with: 'Emmanuel'
    fill_in 'Email', with: 'emmanuel@gmail.com'
    click_on 'signup'
    visit login_path
    fill_in 'User name', with: 'Emmanuel'
    click_on 'Login'
    click_link 'External projects'
    click_link 'Add Project'
    fill_in 'project_name', with: 'React'
    fill_in 'Number of days', with: 6
    click_on 'Create Project'
    expect(page).to have_content('External projects')
  end
end
