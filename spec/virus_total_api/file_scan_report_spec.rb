#!
# coding: utf-8
# frozen_string_literal: true

require 'spec_helper'
require 'support/shared_examples_for_reports'

describe VirusTotalApi::FileScanReport do
  include_examples 'virus total api report', api_key: 'a' * 64, resource: '99017f6eebbac24f351415dd410d522d'
  let(:api_key) { 'a' * 64 }
  let(:resource) { '99017f6eebbac24f351415dd410d522d' }
  let(:report) { described_class.new api_key: api_key, resource: resource }
end
