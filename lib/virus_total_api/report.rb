#!
# coding: utf-8
# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'
require 'json'
require 'rest-client'
require_relative '../virus_total_api'

module VirusTotalApi
  # Parent class for different API report classes
  class Report
    # @return <String>  Base report API URI inherited from VirusTotalApi::BASE_URI
    class_attribute :base_uri
    # @return <String> path component for the specific report
    class_attribute :report_path

    self.base_uri = BASE_URI
    self.report_path = ''

    class << self
      # @return <String> the full Virus Total API path
      def report_uri
        base_uri + report_path
      end
    end

    # Returns a new instance of Report with the @api_key initialised
    # @param api_key <String>
    # @return <Report>
    def initialize(api_key:)
      @api_key = api_key
    end

    def response
      @cached_response ||= JSON.parse(
        RestClient.get(self.class.report_uri, params: params)
      ).deep_symbolize_keys
    end

    private

    def params
      { apikey: @api_key }
    end
  end
end
