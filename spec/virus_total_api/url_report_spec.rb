#!
# coding: utf-8
# frozen_string_literal: true

require 'spec_helper'
require 'support/shared_examples_for_reports'

describe VirusTotalApi::URLReport do
  include_examples 'virus total api report', api_key: 'a' * 64, resource: 'http://example.com'

  let(:api_key) { 'a' * 64 }
  let(:resource) { 'http://example.com' }
  let(:report) { described_class.new api_key: api_key, resource: resource }
end
