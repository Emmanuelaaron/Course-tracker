require 'rails_helper'
RSpec.describe 'External projects', type: :feature do
  scenario 'creating a project user' do
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
    expect(page).to have_content('Sucessfully created React!')
  end

  scenario 'displaying all projects' do
    visit new_user_path
    fill_in 'User name', with: 'Emmanuel'
    fill_in 'Email', with: 'emmanuel@gmail.com'
    click_on 'signup'
    click_link 'External projects'
    click_link 'Add Project'
    fill_in 'project_name', with: 'React'
    fill_in 'Number of days', with: 6
    click_on 'Create Project'
    visit projects_path
    expect(page).to have_content('React')
  end

  scenario 'displaying a specific project' do
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
    visit projects_path
    click_link 'React'
    expect(page).to have_content('6 days')
  end
end
