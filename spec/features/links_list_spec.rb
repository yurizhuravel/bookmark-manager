require './app/models/link'

feature "List of links" do
  scenario "users see lists of links on the page" do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/'
    expect(page).to have_content('Makers Academy')
  end
end
