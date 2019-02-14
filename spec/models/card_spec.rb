require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :question }
    it { is_expected.to have_db_column :answer }
  end
  describe 'Validations' do
    it { is_expected.to validate_presence_of :question }
    it { is_expected.to validate_presence_of :answer }
  end
end
