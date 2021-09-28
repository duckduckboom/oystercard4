class Oystercard
    attr_reader :balance
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
end