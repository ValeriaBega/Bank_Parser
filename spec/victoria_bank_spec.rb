require './victoria_bank'
require_relative 'spec_helper.rb'
require 'open-uri'

describe VictoriaBank do
  let(:subject) { VictoriaBank.new }
  let(:nokogiri) { Nokogiri::HTML }

  context 'Tests single account' do
    let(:html)     { nokogiri.fragment(File.read("spec/fixtures/accounts.html")) }
    it '#parse_acc' do
      account = subject.parse_acc(html)
      expect(account.name).to eq     "MD15VI225911807270111111"
      expect(account.balance).to eq  11111.11
      expect(account.currency).to eq "MDL"
      expect(account.nature).to eq   "Card Account"
    end
  end

  context 'Tests tranaction' do
    let(:html)     { nokogiri.fragment(File.read("spec/fixtures/transaction.html")) }
    it '#parse_transaction' do
      transaction = subject.parse_transaction(html)
      expect(transaction.date).to eq        "2019-05-02"
      expect(transaction.description).to eq "Retail LUKOIL PECO-13 CHISINAU MOLDOVA"
      expect(transaction.amount).to eq      -946.03
    end
  end
end
