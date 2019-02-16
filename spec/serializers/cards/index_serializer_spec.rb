# frozen_string_literal: true

describe Cards::IndexSerializer, type: :serializer do
    let(:sample) { create(:card) }
    let(:serialization) { described_class.new(sample) }
    subject { JSON.parse(serialization.to_json) }
  
    it 'contains relevant keys' do
      expected_keys = %w[question answer user category]
      expect(subject.keys).to match expected_keys
    end
  end