require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'shows welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome to the Sample App!'
  end
end
