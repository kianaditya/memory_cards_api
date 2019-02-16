# frozen_string_literal: true

describe Users::UserInfoSerializer, type: :serializer do
    let(:sample) { create(:user) }
    let(:serialization) { described_class.new(sample) }
    subject { JSON.parse(serialization.to_json) }
  
    it 'contains relevant keys' do
      expected_keys = %w[email]
      expect(subject.keys).to match expected_keys
    end
  end