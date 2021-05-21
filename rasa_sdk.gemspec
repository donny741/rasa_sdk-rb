# frozen_string_literal: true

require_relative "lib/rasa_sdk/version"

Gem::Specification.new do |spec|
  spec.name          = "rasa_sdk"
  spec.version       = RasaSDK::VERSION
  spec.authors       = ["Donatas Povilaitis"]
  spec.email         = ["ddonatasjar@gmail.com"]

  spec.summary       = "Ruby SDK for building Rasa Action Servers"
  spec.homepage      = "https://github.com/donny741/rasa_sdk-rb"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'faraday'

  spec.add_development_dependency 'webmock'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
