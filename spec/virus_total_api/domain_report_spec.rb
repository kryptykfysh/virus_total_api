#!
# coding: utf-8
# frozen_string_literal: true

require 'spec_helper'

describe VirusTotalApi::DomainReport do
  let(:api_key) { 'a' * 64 }
  let(:domain) { 'example.com' }
  let(:report) { described_class.new api_key: api_key, domain: domain }

  describe 'class instance variables' do
    subject { described_class }

    it { is_expected.to respond_to :api_uri }

    describe '@api_uri' do
      it { expect(subject.api_uri).to eq VirusTotalApi::BASE_URI + '/domain/report' }
    end
  end

  describe 'class methods' do
    subject { described_class }

    describe '::new' do
      context 'without an :api_key argument' do
        it { expect { described_class.new domain: domain }.to raise_error ArgumentError }
      end

      context 'without a :domain argument' do
        it { expect { described_class.new api_key: api_key }.to raise_error ArgumentError }
      end

      context 'with valid arguments' do
        subject { report }

        it { is_expected.to be_an_instance_of VirusTotalApi::DomainReport }
        it { expect(subject.instance_variable_get('@api_key')).to eq api_key }
        it { expect(subject.domain).to eq domain }
      end
    end
  end

  describe 'instance attributes' do
    subject { report }

    it { is_expected.to_not respond_to :api_key }
    it { is_expected.to respond_to :domain }
  end

  describe 'instance methods' do
    subject { report }

    it { is_expected.to respond_to :response }
  end
end
