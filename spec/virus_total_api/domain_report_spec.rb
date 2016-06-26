#!
# coding: utf-8
# frozen_string_literal: true

require 'spec_helper'
require 'support/shared_examples_for_reports'

describe VirusTotalApi::DomainReport do
  include_examples 'virus total api report', { api_key: 'a' * 64, domain: 'example.com' }

  let(:api_key) { 'a' * 64 }
  let(:domain) { 'example.com' }
  let(:report) { described_class.new api_key: api_key, domain: domain }

  describe 'class methods' do
    subject { described_class }

    describe '::new' do
      context 'without a :domain argument' do
        it { expect { described_class.new api_key: api_key }.to raise_error ArgumentError }
      end

      context 'with valid arguments' do
        subject { report }

        it { is_expected.to be_an_instance_of VirusTotalApi::DomainReport }
        it { expect(subject.domain).to eq domain }
      end
    end
  end

  describe 'instance attributes' do
    subject { report }

    it { is_expected.to respond_to :domain }
  end
end
