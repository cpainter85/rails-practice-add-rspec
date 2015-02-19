require 'rails_helper'

  feature 'Events' do

    scenario 'User edits an event' do
      Event.create!(
        description: 'My aweeesome event'
      )

      visit root_path
      expect(page).to have_content('My aweeesome event')
      click_on 'edit'
      fill_in 'Description', with: 'My awesome event'
      click_on 'Update Event'

      expect(page).to have_content('My awesome event')
      expect(page).to have_no_content('My aweeesome event')
    end

    scenario 'User create a new event' do
      visit root_path
      click_on 'New Event'
      fill_in 'Description', with: 'My new event'
      click_on 'Create Event'

      expect(page).to have_content('My new event')
    end

    scenario 'User deletes an event' do
      Event.create!(
        description: 'My soon to be deleted event'
      )

      visit root_path
      expect(page).to have_content('My soon to be deleted event')
      click_on 'delete'
      expect(page).to have_no_content('My soon to be deleted event')

    end

    scenario 'User visits an event show page' do
      Event.create!(
        description: 'My show event'
      )
      visit root_path
      expect(page).to have_content('My show event')
      click_on 'My show event'
      expect(page).to have_content('Description: My show event')
    end

  end
