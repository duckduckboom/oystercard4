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
        return @in_travel
    end

    def touch_in
        if (@balance <= MINIMUM_BALANCE)
            fail "Not enough balance to travel."
        else
            @in_travel = true    
        end
       
    end

    def touch_out
        deduct(MINIMUM_FARE)
        @in_travel = false
    end

    private
    def deduct(fare)
        @balance -= fare
    end

end