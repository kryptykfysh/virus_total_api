#!
# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'virus_total_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'virus_total_api'
  spec.version       = VirusTotalApi::VERSION
  spec.authors       = ['Kryptykfysh']
  spec.email         = ['kryptykfysh@kryptykfysh.co.uk']

  spec.summary       = %w(A Ruby wrapper for the VirusTotal API.)
  spec.description   = File.read('README.md')
  spec.homepage      = 'https://github.com/kryptykfysh/virus_total_api'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '~> 4.2', '>= 4.2.6'
  spec.add_runtime_dependency 'rest-client', '~> 1.8'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'guard-rspec', '~> 4.7', '>= 4.7.2'
  spec.add_development_dependency 'pry', '~> 0.10', '>= 0.10.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'reek', '~> 4.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.41'
  spec.add_development_dependency 'simplecov', '~> 0.11', '>= 0.11.2'
  spec.add_development_dependency 'yard', '~> 0.8', '>= 0.8.7'
end
