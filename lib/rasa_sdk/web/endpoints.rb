# frozen_string_literal: true

module RasaSDK
  module Web
    module Endpoints
      def model_parse(text:, emulation_mode: nil, message_id: nil)
        post('/model/parse', body: { text: text, emulation_mode: emulation_mode, message_id: message_id })
      end

      def conversations_add_messages(conversation_id:, text:, parse_data: nil, sender: 'user')
        post("/conversations/#{conversation_id}/messages", body: { text: text, parse_data: parse_data, sender: 'user' })
      end

      def conversations_trigger_intent(conversation_id:, name:)
        post("/conversations/#{conversation_id}/trigger_intent", body: { name: name })
      end

      def tracker_add_event(conversation_id:, events:)
        post("/conversations/#{conversation_id}/tracker/events", body: events.to_json)
      end

      def webhook(webhook_name:, body:)
        post("/webhooks/#{webhook_name}/webhook", body: body)
      end
    end
  end
end
