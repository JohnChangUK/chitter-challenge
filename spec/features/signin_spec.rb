feature 'sign in' do

  let(:user) do
    User.create(name: 'test', email: 'test@test.com', password: '123', password_confirmation: '123')
  end

  scenario 'sign in with no issues' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hi #{user.name}"
  end

    scenario 'when signed in, user cannot sign in again' do
      sign_in(email: user.email, password: user.password)
      visit '/users/new'
      expect(page).to have_content 'You are signed in, cannot sign in again'
      expect(page).not_to have_content 'What is your name?'
    end 
end
