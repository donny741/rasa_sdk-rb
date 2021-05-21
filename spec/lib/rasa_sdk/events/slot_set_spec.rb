# frozen_string_literal: true

RSpec.describe RasaSDK::Events::SlotSet, '.run' do
  subject { described_class.run(name: name, value: value, timestamp: timestamp) }

  let(:name) { 'slot_name' }
  let(:value) { 'slot_value' }
  let(:timestamp) { nil }

  it { is_expected.to eq(event: 'slot', name: name, value: value, timestamp: timestamp) }
end
