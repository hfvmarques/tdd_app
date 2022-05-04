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
        context 'fill in the form' do
          before do
            fill_in 'Name', with: Faker::Name.name
            fill_in 'Email', with: Faker::Internet.email
            fill_in 'Phone', with: Faker::PhoneNumber.phone_number
            attach_file 'Image', "#{Rails.root}/spec/fixtures/images/customer.jpg"
            choose(option: ['M', 'F', 'O'].sample)

            click_on 'Create Customer'
          end

          scenario { expect(page).to have_content('Customer was successfully created.') }
          scenario { expect(Customer.last.name).to be_kind_of(String) }
          scenario { expect(Customer.last.email).to be_kind_of(String) }
        end
      end
    end
  end
end
