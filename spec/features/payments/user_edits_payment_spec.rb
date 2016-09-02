require 'spec_helper'

feature 'User edits student' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Abacki' }
  let!(:payment) { create :payment, subscription: 100, student_id: student.id}

  background do
  	sign_in
  	expect(page).to have_content 'Logout'
  	visit payments_path
  	find(:xpath, "//a[@title='edit']").click
  end

  scenario 'with valid input' do
  	fill_in 'Subscription', with: '140'
  	click_button 'Update Payment'
  	expect(page).to have_content 'Payment has been created!'
  	expect(page).to have_content '140'
  end

  scenario 'with invalid input' do
  	fill_in 'Subscription', with: ''
  	click_button 'Update Payment'
  	expect(page).to have_content "can't be blank"
  end
end
