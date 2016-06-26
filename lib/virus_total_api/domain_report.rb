#!
# coding: utf-8
# frozen_string_literal: true

require 'json'
require 'rest-client'
require_relative '../virus_total_api'

module VirusTotalApi
  # A response object from the VirusTotal Api for a domain report query
  class DomainReport
    class << self
      attr_reader :api_uri
    end

    @api_uri = BASE_URI + '/domain/report'

    # @return <String> the domain name being queried
    attr_reader :domain

    # Returns a VirusTotalApi::DomainReport instance
    # params api_key <String> a valid VT API Key
    # @params domain <String> the domain name to report on
    # @return <VirusTotalApi::DomainReport>
    def initialize(api_key:, domain:)
      @api_key = api_key
      @domain = domain
    end

    def response
      JSON.parse(RestClient.get(self.class.api_uri, params: params))
    end

    private

    def params
      { apikey: @api_key, domain: @domain }
    end
  end
end
