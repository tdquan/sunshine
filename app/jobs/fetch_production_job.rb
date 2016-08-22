class FetchProductionJob < ActiveJob::Base
  queue_as :default

  def perform(panel_id, time, att)
    unless panel_id.nil?
      production = ProductionPattern.find_by(solar_panel_id: panel_id, time: time)
      production.attributes.each do |a,v|
        if a.include? att
          return v
        end
      end
    end
  end
end
