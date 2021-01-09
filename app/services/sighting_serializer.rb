class SightingSerializer
    
  def initialize(sighting_object)
    @sighting = sighting_object
    render json: SightingSerializer.new(sightings).to_serialized_json
  end
    
  def to_serialized_json
    @sighting.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:updated_at])
  end
 

end