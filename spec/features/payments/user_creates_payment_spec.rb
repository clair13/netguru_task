require 'spec_helper'

feature 'User creates payment' do
	let!(:student) { create :student }

	background do
		sign_in
		expect(page).to have_content 'Logout'
		visit payments_path
		click_on 'Add new one'
	end

	scenario 'with valid input' do
		select student.decorate.full_name, from: 'Student'
		fill_in 'Subscription', with: '100'
		click_button 'Create Payment'
		expect(page).to have_content 'Payment has been created!'
	end

	scenario 'with missing student' do
		fill_in 'Subscription', with: '100'
		click_button 'Create Payment'
		expect(page).to have_content "can't be blank"
	end

	scenario 'with missing subscription' do
		select student.decorate.full_name, from: 'Student'
		click_button 'Create Payment'
		expect(page).to have_content "can't be blank"
	end

end