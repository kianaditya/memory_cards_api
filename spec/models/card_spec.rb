require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :question }
    it { is_expected.to have_db_column :answer }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :question }
    it { is_expected.to validate_presence_of :answer }
    it { is_expected.to validate_presence_of :category_id }
    it { is_expected.to validate_presence_of :user_id }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:card)).to be_valid
    end
  end
end
