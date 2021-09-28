require "oystercard"

describe Oystercard do
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
       balance_limit = Oystercard::BALANCE_LIMIT
        subject.initialise(0)
        expect(subject.top_up(balance_limit + 1)).to eq("Card limit of #{balance_limit} will be exceeded.") 
      end
    #   If a user is going to top-up their card up above the limit, we expect this to refuse their top-up and raise a warning.

    end 
end    

 