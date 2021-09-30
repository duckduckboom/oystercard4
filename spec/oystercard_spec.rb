require "oystercard"

describe Oystercard do
  let(:station) { double :station }
  let(:subject) {described_class.new(0)}

  balance_limit = Oystercard::BALANCE_LIMIT
  minimum_balance = Oystercard::MINIMUM_BALANCE
  minimum_fare = Oystercard::MINIMUM_FARE

  it "initialise card with 0 balance" do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds an amount to the balance" do
      expect(subject.top_up(10)).to eq(subject.balance)
    end  

    it "refuses to top-up above balance limit" do
      expect(subject.top_up(balance_limit + 1)).to eq("Card limit of #{balance_limit} will be exceeded.") 
    end
  end

  # describe 'deduct balance' do

  #   it { is_expected.to respond_to(:deduct).with(1).argument }
    
  #   it "deducts fare from card balance" do
  #     subject = Oystercard.new(balance_limit)
  #     expect(subject.deduct(30)).to eq(subject.balance)
  #   end
  # end

  describe 'touch in' do
    it { is_expected.to respond_to(:in_journey?) }

    it "changes in_travel status to true" do
      subject = Oystercard.new(minimum_balance + 1)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
    end

    it "expects card to remember entry station" do
      subject = Oystercard.new(balance_limit)
      expect(subject.touch_in(station)).to eq(station)
    end

  end

  describe 'touch out' do

    it "changes in_travel status to false" do
      subject.touch_out
      expect(subject.in_journey?).to eq(false)
    end

    it "raises error is balance is too low" do
      subject = Oystercard.new(minimum_balance - 1)
      expect { subject.touch_in(station) }.to raise_error "Not enough balance to travel."
    end

    it "charges card on touch out" do
      subject = Oystercard.new(balance_limit)
      expect {subject.touch_out}.to change {subject.balance}.by(-minimum_fare)
    end

    it "expects card to forget entry station" do
      subject = Oystercard.new(balance_limit)
      expect(subject.touch_out).to eq(nil)
    end

  end

end    