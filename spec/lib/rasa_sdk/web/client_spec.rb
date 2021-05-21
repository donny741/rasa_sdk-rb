# frozen_string_literal: true

RSpec.describe RasaSDK::Web::Client do
  subject(:client) { described_class.new(host: host) }

  let(:host) { 'http://example.com' }
  describe 'endpoints' do
    shared_examples 'request sender' do
      before do
        stub_request(expected_request_method, expected_request_url)
          .with(body: expected_request_body)
          .to_return(status: 200, body: response_body.to_json)
      end

      let(:response_body) { { ok: true } }

      it 'sends request with correct parameters to correct host' do
        expect(subject).to eq(response_body)
      end
    end

    describe '#model_parse' do
      subject { client.model_parse(text: text) }

      let(:text) { 'text to parse' }

      let(:expected_request_method) { :post }
      let(:expected_request_url) { "#{host}/model/parse" }
      let(:expected_request_body) { { text: text, emulation_mode: nil, message_id: nil } }

      it_behaves_like 'request sender'
    end

    describe '#model_parse' do
      subject { client.model_parse(text: text) }

      let(:text) { 'text to parse' }

      let(:expected_request_method) { :post }
      let(:expected_request_url) { "#{host}/model/parse" }
      let(:expected_request_body) { { text: text, emulation_mode: nil, message_id: nil } }

      it_behaves_like 'request sender'
    end

    describe '#conversations_add_messages' do
      subject { client.conversations_add_messages(conversation_id: conversation_id, text: text) }

      let(:conversation_id) { '1' }
      let(:text) { 'text to parse' }

      let(:expected_request_method) { :post }
      let(:expected_request_url) { "#{host}/conversations/#{conversation_id}/messages" }
      let(:expected_request_body) { { text: text, parse_data: nil, sender: 'user' } }

      it_behaves_like 'request sender'
    end

    describe '#conversations_trigger_intent' do
      subject { client.conversations_trigger_intent(conversation_id: conversation_id, name: name) }

      let(:conversation_id) { '1' }
      let(:name) { 'intent_name' }

      let(:expected_request_method) { :post }
      let(:expected_request_url) { "#{host}/conversations/#{conversation_id}/trigger_intent" }
      let(:expected_request_body) { { name: name } }

      it_behaves_like 'request sender'
    end

    describe '#tracker_add_event' do
      subject { client.tracker_add_event(conversation_id: conversation_id, events: events) }

      let(:conversation_id) { '1' }
      let(:events) { [{ name: 'slot', name: 'name', value: 'value'}] }

      let(:expected_request_method) { :post }
      let(:expected_request_url) { "#{host}/conversations/#{conversation_id}/tracker/events" }
      let(:expected_request_body) { events.to_json }

      it_behaves_like 'request sender'
    end

    describe '#webhook' do
      subject { client.webhook(webhook_name: webhook_name, body: body) }

      let(:webhook_name) { 'my_webhook' }
      let(:body) { { sender: 'sender', text: 'message_text' } }

      let(:expected_request_method) { :post }
      let(:expected_request_url) { "#{host}/webhooks/#{webhook_name}/webhook" }
      let(:expected_request_body) { body }

      it_behaves_like 'request sender'
    end
  end
end
