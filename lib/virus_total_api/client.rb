#!
# coding: utf-8
# frozen_string_literal: true

require_relative './domain_report'

module VirusTotalApi
  # Class providing clients to connect to the VirusTotal API
  class Client
    # Creates and returns a new instance of the Client class
    # @params <String> the VirusTotal API Key to use for the connection
    # @return <VirusTotalApi::Client>
    def initialize(api_key)
      raise ArgumentError, 'VirusTotal API keys are 64 characters long' unless api_key.size == 64
      @api_key = api_key
    end

    # Looks up the provided Domain Name argument and returns a response Hash
    # @params <String> the domain name to query
    # @return <Hash>
    def domain_report(domain)
      DomainReport.new(api_key: @api_key, domain: domain).response
    end
  end
end
