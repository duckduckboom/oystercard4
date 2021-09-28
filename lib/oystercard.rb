class Oystercard
    attr_reader :balance
    attr_reader :in_travel
    BALANCE_LIMIT = 90
    
    def initialise(balance)
        @balance = balance  
    end

    def top_up(top_up_amount)
        (@balance + top_up_amount > BALANCE_LIMIT) ? "Card limit of #{BALANCE_LIMIT} will be exceeded." : @balance += top_up_amount
    end    

    def deduct(fare)
        @balance -= fare
    end

    def in_journey?
        return @in_travel
    end

    def touch_in
        @in_travel = true
    end

    def touch_out
        @in_travel = false
    end

end