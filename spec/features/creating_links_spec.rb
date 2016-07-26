feature 'create a link with a url and title' do
  scenario 'user adds a link' do
    visit '/links/new'
    fill_in "title", :with => "Google"
    fill_in "url", :with => "http://www.google.com"
    click_button('Add link')
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content "Google"
    end
  end
end
