class FetchUsageJob < ActiveJob::Base
  queue_as :default

  def perform(user_id)
    unless user_id.nil?
      arr = ConsumptionPattern.where(user_id: user_id)
      arr.each do |p|
        p.attributes.each do |a,v|
          if a.include? "hour"
            puts "#{v}"
            sleep 5
          end
        end
      end
    end
  end
end
