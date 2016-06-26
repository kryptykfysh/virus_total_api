#!
# coding: utf-8
# frozen_string_literal: true

require 'spec_helper'

describe VirusTotalApi do
  describe 'constants' do
    it 'has a version number' do
      expect(VirusTotalApi::VERSION).not_to be nil
    end

    it 'has a base uri' do
      expect(VirusTotalApi::BASE_URI).not_to be nil
    end
  end
end
