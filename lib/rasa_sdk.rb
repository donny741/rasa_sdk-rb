# frozen_string_literal: true

require_relative 'rasa_sdk/version'
require_relative 'rasa_sdk/events/base'
require_relative 'rasa_sdk/events/slot_set'

module RasaSDK
  class Error < StandardError; end
end
