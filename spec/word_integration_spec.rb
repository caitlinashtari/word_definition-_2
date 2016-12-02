require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add Word path', {:type => :feature}) do
  it('takes user input and creates a word object, then sends user to success page') do
    visit('/')
    fill_in('word', :with=> "heartsease")
    fill_in('definition', :with=> "peace of mind")
    fill_in('speach_part', :with=> "noun")
    click_button("Add Word")
    expect(page).to have_content('Your word has been successfully added!')
  end
end

describe('the add another word/see words path', {:type => :feature}) do
  it('takes the user back to the index page to add another word or view words') do
    visit('/')
    fill_in('word', :with=> "heartsease")
    fill_in('definition', :with=> "peace of mind")
    fill_in('speach_part', :with=> "noun")
    click_button("Add Word")
    click_link('Back')
    expect(page).to have_content('Dictionary')
  end
end
