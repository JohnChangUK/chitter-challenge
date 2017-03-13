require 'web_helper'

feature "sign out" do
  before(:each) do
    User.create(name: 'test', email: 'makers@makers.com', password: '123', password_confirmation: '123')
  end

  scenario 'sign out' do
    sign_in(email: 'makers@makers.com', password: '123')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye')
    expect(page).not_to have_content('Welcome, makers')
  end
end
