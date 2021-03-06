require 'rails_helper'

describe 'as a user on the home page' do
  context 'when I select Slytherin from a drop down' do
    it 'returns a list of those students' do
      # As a user
      # When I visit "/"
      visit root_path
      # And I select "Slytherin" from the dropdown
      select('Slytherin', :from => 'house')
      # And I click on "Get Students"
      click_on 'Get Students'
      # Then my path should be "/search" with "house=slytherin" in the parameters
      #? expect(current_path).to eq('/search?house=slytherin')
      # And I should see a message "22 Students"
      expect(page).to have_content("22 Students")
      # And I should see a list of the 22 members of Slytherin
      expect(page).to have_css('.student', count: 22)
      # And I should see a name and id for each student.
      within first('.student') do
        expect(page).to have_css('.name')
        expect(page).to have_css('.id')
      end
    end
  end
end
