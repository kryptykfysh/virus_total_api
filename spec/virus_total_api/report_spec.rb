#!
# coding: utf-8
# frozen_string_literal: true

require 'spec_helper'
require 'support/shared_examples_for_reports'

describe VirusTotalApi::Report do
  include_examples 'virus total api report', { api_key: 'a' * 64 }
end
