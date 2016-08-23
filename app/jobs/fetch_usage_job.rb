class FetchUsageJob < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    unless user_id.nil?
      user= User.find(user_id)
      # Get all daily usage pattern
      arr = ConsumptionPattern.all.sort
      # Get 1 day pattern
      arr.each do |p|
        p.attributes.each do |a,v|
          # Running through all the hourly values
          if a.include? "hour"
            puts "#{p.time} : #{a} : #{v}"
            # Check if current user has a solar_panel
            if user.solar_panel != nil
              # For testing purpose
              ProductionPattern.all.each do |p|
                p.solar_panel_id = user.solar_panel.id
                p.save
              end

              # End of testing


              prod = FetchProductionJob.perform_now(p.time, a)
              if prod > v
                @excess = (prod - v).round(2)
                puts "The excess is #{@excess}"
                surplus_distribution(user, @excess, p.time, a, v)
              end
            end
            sleep 2
          end
        end
      end
    end
  end
end



def surplus_distribution(user, excess, date, hour, pattern)

  @pattern = pattern #normal user consumption
  @excess = excess

  user.solar_panel.contracts.each do |contract|
    next if @excess == 0
    next if contract.end_date

    if @excess > @pattern
      @amount = pattern
      @excess -= @amount
    else
      @amount = @excess
      @excess -= @amount
    end

    puts "Contract Nr. #{contract.id} gets #{@amount}"

    Transaction.create(
    excess: @amount,
    time: hour,
    date: date,
    contract_id: contract.id,
    fee: user.solar_panel.price
    )

  end


end

