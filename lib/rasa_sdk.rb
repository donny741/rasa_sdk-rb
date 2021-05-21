# frozen_string_literal: true

require_relative 'rasa_sdk/version'

require_relative 'rasa_sdk/events/base'
require_relative 'rasa_sdk/events/slot_set'

require_relative 'rasa_sdk/web/client'

module RasaSDK
  class Error < StandardError; end
end
