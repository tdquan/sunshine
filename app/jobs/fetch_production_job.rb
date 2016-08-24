class FetchProductionJob < ActiveJob::Base
  queue_as :default

  def perform(time, att)
    unless time.nil?
      production = ProductionPattern.find_by(time: time)
      production.attributes.each do |a,v|
        if a.include? att
          return v
        end
      end
    end
  end
end
