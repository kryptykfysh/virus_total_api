#!
# coding: utf-8
# frozen_string_literal: true

require_relative './report'

module VirusTotalApi
  # A response object from the VirusTotal Api for a file scan report
  class FileScanReport < Report
    self.report_path = '/file/report'

    attr_reader :resource

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
