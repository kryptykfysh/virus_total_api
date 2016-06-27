#!
# coding: utf-8
# frozen_string_literal: true

require_relative './report'

module VirusTotalApi
  # A response object from the VirusTotal API for a URL report query
  class URLReport < Report
    self.report_path = '/url/report'

    # @return [String] the URL being queried
    attr_reader :resource

    # Returns a VirusTotalApi::URLReport instance
    # @param api_key [String] a valid VT API Key
    # @param resource [String] the URL to report on
    # @return [VirusTotalApi::URLReport]
    def initialize(api_key:, resource:)
      super(api_key: api_key)
      @resource = resource
    end

    private

    def params
      super.merge(resource: @resource)
    end
  end
end
