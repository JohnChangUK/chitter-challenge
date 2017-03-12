feature 'Posting Peep' do

  scenario 'a user can post a new peep' do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'First peep'
    click_button 'Peep it'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'First peep'
    expect(page).to have_content('=> test')
  end

  scenario 'a user tries to peep while signed out' do
    visit '/peeps.new'
    expect(page).to have_content('Please sign in to peep')
    expect(page).not_to have_content 'Post a peep'
  end
end
