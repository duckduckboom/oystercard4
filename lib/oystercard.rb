class Oystercard
    attr_reader :balance, :journey_history, :in_travel
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

    def touch_out(exit_station)
        deduct(MINIMUM_FARE)
        @exit_station = exit_station
    end

    def journey
        @journey_history = { "Entry Station" => @entry_station, "Exit Station" => @exit_station}
    end

    private
    def deduct(fare)
        @balance -= fare
    end

end