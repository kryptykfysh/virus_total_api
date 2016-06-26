#!
# coding: utf-8
# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'virus total api report' do |setup_arguments|
  let(:api_key) { 'a' * 64 }
  let(:report) { described_class.new setup_arguments }

  describe 'class methods' do
    subject { described_class }

    it { is_expected.to respond_to :new }

    context 'without an api_key argument' do
      it { expect { subject.new }.to raise_error ArgumentError }
    end

    context 'with a valid api_key argument' do
      it { expect(subject.new(setup_arguments)).to be_an_instance_of described_class }
      it 'sets the @api_key instance variable' do
        expect(report.instance_variable_get('@api_key')).to eq api_key
      end
    end
  end

  describe 'class methods' do
    subject { described_class }

    it { is_expected.to respond_to :report_uri }

    describe '::report_uri' do
      it { expect(subject.report_uri).to eq(subject.base_uri + subject.report_path) }
    end
  end

  describe 'class instance variables' do
    subject { described_class }

    it { is_expected.to respond_to :base_uri }
    it { is_expected.to respond_to :report_path }

    describe '@base_uri' do
      it { expect(subject.base_uri).to eq VirusTotalApi::BASE_URI }
    end
  end

  describe 'instance methods' do
    subject { report }
    let(:cached_response) { { wibble: 'hat' } }
    before { allow(RestClient).to receive(:get).and_return(cached_response.to_json) }

    it { is_expected.to respond_to :response }

    describe '#response' do
      context 'when @cached_response is set' do
        before { subject.instance_variable_set('@cached_response', cached_response) }

        it 'does not call the RestClient class' do
          expect(RestClient).to_not receive(:get)
          subject.response
        end

        it { expect(subject.response).to eq cached_response }
      end

      context 'when @cached_response is nil' do
        before { subject.instance_variable_set('@cached_response', nil) }

        it 'calls RestClient.get with params' do
          expect(RestClient).to receive(:get).with(described_class.report_uri, params: subject.send(:params))
          subject.response
        end

        it { expect(subject.response).to eq cached_response }
      end
    end
  end

  describe 'instance attributes' do
    subject { report }

    it { is_expected.to_not respond_to :api_key }
    it { is_expected.to_not respond_to :cached_response }
  end
end
