#!
# coding: utf-8
# frozen_string_literal: true

require_relative './report'
require_relative './domain_report'
require_relative './file_scan_report'
require_relative './url_report'

module VirusTotalApi
  # Class providing clients to connect to the VirusTotal API
  class Client
    # Creates and returns a new instance of the Client class
    # @param api_key [String] the VirusTotal API Key to use for the connection
    # @return [VirusTotalApi::Client]
    def initialize(api_key)
      raise ArgumentError, 'VirusTotal API keys are 64 characters long' unless api_key.size == 64
      @api_key = api_key
    end

    # Looks up the provided Domain Name argument and returns a response Hash
    # @param domain [String] the domain name to query
    # @return [Hash]
    def domain_report(domain)
      DomainReport.new(api_key: @api_key, domain: domain).response
    end

    # Looks up the provided file hash argument and returns a response Hash
    # @param file_hash [String] the file hash to query
    # @return [Hash]
    def file_report(file_hash)
      FileScanReport.new(api_key: @api_key, resource: file_hash).response
    end

    # Looks up the provided URL argument and returns a response Hash
    # @param url [String] the URL to look up
    # @return [Hash]
    def url_report(url)
      URLReport.new(api_key: @api_key, resource: url).response
    end
  end
end
