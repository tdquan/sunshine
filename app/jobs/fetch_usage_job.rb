class FetchUsageJob < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    unless user_id.nil?
      user= User.find(user_id)
      # Get all daily usage pattern
      arr = ConsumptionPattern.where(user_id: user_id).sort
      # Get 1 day pattern
      arr.each do |p|
        p.attributes.each do |a,v|
          # Running through all the hourly values
          if a.include? "hour"
            puts "#{p.time} : #{a} : #{v}"
            # Check if current user has a solar_panel
            if user.solar_panel !nil
              # For testing purpose
              ProductionPattern.all.each do |p|
                p.solar_panel_id = user.solar_panel.id
                p.save
              end

              # End of testing


              prod = FetchProductionJob.perform_now(user.solar_panel.id, p.time, a)
              if prod > v
                puts "The excess is #{(prod - v).round(2)}"
              end
            end
            sleep 5
          end
        end
      end
    end
  end
end
