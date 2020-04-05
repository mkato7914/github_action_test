require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by :selenium, using: :headless_chrome do |driver_options|
      driver_options.add_argument('--disable-dev-shm-usage')
      driver_options.add_argument('--no-sandbox')
    end
  end

  it 'is valid' do
    visit new_user_path
    fill_in 'Name', with: 'yamada'
    fill_in 'Age', with: 30
    click_button 'Create User'
    expect(page).to have_content 'User was successfully created.'
  end

  it 'is invalid without name' do
    visit new_user_path
    fill_in 'Age', with: 30
    click_button 'Create User'
    expect(page).to have_content "Name can't be blank"
  end
end
