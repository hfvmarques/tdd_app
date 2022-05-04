require 'rails_helper'

feature "Welcome", type: :feature do
  context 'visit the root path' do
    before do
      visit root_path
    end

    scenario { expect(page).to have_content 'Welcome to the Sample App!' }
    scenario { expect(find('ul li')).to have_link('Customers') }
  end
end
