require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  before :each do
    @user = User.create!(
      name: 'User One',
      email: 'test@test.ca',
      password: '123abc',
      password_confirmation: '123abc'
    )
  end

  scenario "Process of login in" do
    visit login_path

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password

    click_on('Submit')

    expect(page).to have_content('Logout')
  end
end
