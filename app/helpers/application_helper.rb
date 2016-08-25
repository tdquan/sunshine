module ApplicationHelper


  def producer_markers
    Gmaps4rails.build_markers(@solar_panels) do |solar_panel, marker|
      marker.lat solar_panel.latitude
      marker.lng solar_panel.longitude
      marker.infowindow render("/solar_panels/map_box", solar_panel: solar_panel)
       marker.picture({
        "url" => image_path("producer_label.png"), #"http://placehold.it/350x150", #          # string,  mandatory
        "width" => 45,          # integer, mandatory
        "height" => 67          # integer, mandatory
      })
    end
  end

  def consumer_markers
    Gmaps4rails.build_markers(@consumers) do |consumer, marker|
      marker.lat consumer.latitude
      marker.lng consumer.longitude
      marker.picture({
        "url" => image_path("consumer_label.png"), #"http://placehold.it/350x150", #          # string,  mandatory
        "width" => 45,          # integer, mandatory
        "height" => 67          # integer, mandatory
      })

      # #{url: "http://placehold.it/60x60", width: 20, height: 20}
      # marker.infowindow render_to_string(partial: "/solar_panels/map_box", locals: { solar_panel: })
      # ]
    end
  end

  def panel_marker(solar_panel)
    Gmaps4rails.build_markers(solar_panel) do |solar_panel, marker|
      marker.lat solar_panel.latitude
      marker.lng solar_panel.longitude
      marker.infowindow render("/solar_panels/map_box", solar_panel: solar_panel)
       marker.picture({
        "url" => image_path("producer_label.png"), #"http://placehold.it/350x150", #          # string,  mandatory
        "width" => 45,          # integer, mandatory
        "height" => 67          # integer, mandatory
      })
    end
  end

end
