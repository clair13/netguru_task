require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
  	it { is_expected.to validate_presence_of :subscription }
  	it { is_expected.to validate_presence_of :student_id }
  end

  describe 'database columns' do
  	it { should have_db_column :subscription}
  	it { should have_db_column :student_id}
  end

  describe 'associations' do
  	it { is_expected.to belong_to :student}
  end



end
