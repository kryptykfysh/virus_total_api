#!
# coding: utf-8
# frozen_string_literal: true

require 'spec_helper'

describe VirusTotalApi::Client do
  let(:valid_api_key) { 'a' * 64 }
  let(:client) { described_class.new valid_api_key }

  describe 'class methods' do
    subject { described_class }

    describe '::new' do
      context 'called without an API Key String argument' do
        it { expect { subject.new }.to raise_error(ArgumentError) }
      end

      context 'called with an API Key String argument' do
        context 'when the API Key is not 64 characters' do
          let(:api_key) { 'wibble' }
          let(:error_message) { 'VirusTotal API keys are 64 characters long' }

          it { expect { subject.new api_key }.to raise_error(ArgumentError, error_message) }
        end

        context 'with a valid API key' do
          subject { client }

          it 'sets the @api_key instance attribute' do
            expect(subject.instance_variable_get('@api_key')).to eq valid_api_key
          end
        end
      end
    end
  end
  describe 'instance attributes' do
    subject { client }

    it { is_expected.to_not respond_to :api_key }
  end

  describe 'instance methods' do
    subject { client }

    it { is_expected.to respond_to :domain_report }
    it { is_expected.to respond_to :file_report }
    it { is_expected.to respond_to :url_report }

    describe '#domain_report' do
      context 'without a domain name argument' do
        it { expect { subject.domain_report }.to raise_error ArgumentError }
      end

      context 'with a domain name argument' do
        let(:domain) { 'example.com' }
        let(:response_hash) { { wibble: 'arse' } }

        before { allow(RestClient).to receive(:get).and_return(response_hash.to_json) }

        it { expect(subject.domain_report(domain)).to be_an_instance_of Hash }
        it { expect(subject.domain_report(domain)).to eq response_hash }
      end
    end

    describe '#file_report' do
      context 'without a file hash argument' do
        it { expect { subject.file_report }.to raise_error ArgumentError }
      end

      context 'with a file name argument' do
        let(:file_hash) { '1' * 64 }
        let(:response_hash) { { wibble: 'arse' } }

        before { allow(RestClient).to receive(:get).and_return(response_hash.to_json) }

        it { expect(subject.file_report(file_hash)).to be_an_instance_of Hash }
        it { expect(subject.file_report(file_hash)).to eq response_hash }
      end
    end

    describe '#url_report' do
      context 'without a url argument' do
        it { expect { subject.url_report }.to raise_error ArgumentError }
      end

      context 'with a valid URL argument' do
        let(:url) { 'http://example.com' }
        let(:response_hash) { { wibble: 'arse' } }

        before { allow(RestClient).to receive(:get).and_return(response_hash.to_json) }

        it { expect(subject.url_report(url)).to be_an_instance_of Hash }
        it { expect(subject.url_report(url)).to eq response_hash }
      end
    end
  end
end
