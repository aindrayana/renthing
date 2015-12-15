module ItemsHelper

  def items_json(items)
    Gmaps4rails.build_markers(items) do |item, marker|
      marker.lat        item.latitude
      marker.lng        item.longitude
      marker.infowindow item.title
    end
  end

end
