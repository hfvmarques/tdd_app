require 'rails_helper'

feature "Customers", type: :feature do
  context 'visit the root path' do
    before do
      visit root_path
    end

    scenario { expect(page).to have_link('Customers') }

    context 'click on Customers' do
      before do
        click_link 'Customers'
      end

      scenario { expect(page).to have_content('All Customers') }
      scenario { expect(page).to have_link('New Customer') }

      context 'click on New Customer' do
        before do
          click_link 'New Customer'
        end

        scenario { expect(page).to have_content('New Customer') }
      end
    end
  end
end
