class Oystercard
    attr_reader :balance
    attr_reader :in_travel
    BALANCE_LIMIT = 90
    MINIMUM_BALANCE = 1
    MINIMUM_FARE = 1
    
    def initialize(balance)
        @balance = balance  
    end

    def top_up(top_up_amount)
        (@balance + top_up_amount > BALANCE_LIMIT) ? "Card limit of #{BALANCE_LIMIT} will be exceeded." : @balance += top_up_amount
    end    

    def in_journey?
        if @entry_station == nil
            false
        else
            true
        end
    end

    def touch_in(entry_station)
        if (@balance <= MINIMUM_BALANCE)
            fail "Not enough balance to travel."
        else
            @entry_station = entry_station
        end
       
    end

    def touch_out
        deduct(MINIMUM_FARE)
        @entry_station = nil
    end

    private
    def deduct(fare)
        @balance -= fare
    end

end