#!
# coding: utf-8
# frozen_string_literal: true

require_relative './report'

module VirusTotalApi
  # A response object from the VirusTotal Api for a domain report query
  class DomainReport < Report
    self.report_path = '/domain/report'

    # @return [String] the domain name being queried
    attr_reader :domain

    # Returns a VirusTotalApi::DomainReport instance
    # @param api_key [String] a valid VT API Key
    # @param domain [String] the domain name to report on
    # @return [VirusTotalApi::DomainReport]
    def initialize(api_key:, domain:)
      super(api_key: api_key)
      @domain = domain
    end

    private

    def params
      super.merge(domain: @domain)
    end
  end
end
