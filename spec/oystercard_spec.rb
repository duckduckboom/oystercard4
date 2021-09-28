require "oystercard"

describe Oystercard do

  balance_limit = Oystercard::BALANCE_LIMIT

  it "intialise card balance" do
      expect(subject.initialise(0)).to eq(0)
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds an amount to the balance" do
      subject.initialise(0)
      expect(subject.top_up(10)).to eq(subject.balance)
    end  

    it "refuses to top-up above balance limit" do
      subject.initialise(0)
      expect(subject.top_up(balance_limit + 1)).to eq("Card limit of #{balance_limit} will be exceeded.") 
    end
  end

  describe 'deduct balance' do

    it { is_expected.to respond_to(:deduct).with(1).argument }
    
    it "deducts fare from card balance" do
      subject.initialise(balance_limit)
      expect(subject.deduct(30)).to eq(subject.balance)
    end
  end

  describe 'touch in and out' do
    
    it { is_expected.to respond_to(:in_journey?) }

    it "changes in_travel status to true" do
      subject.touch_in
      expect(subject.in_journey?).to eq(subject.in_travel)
    end

    it "changes in_travel status to false" do
      subject.touch_out
      expect(subject.in_journey?).to eq(subject.in_travel)
    end


  end

end    