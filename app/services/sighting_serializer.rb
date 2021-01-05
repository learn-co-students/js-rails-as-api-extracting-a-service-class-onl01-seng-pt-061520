class SightingSerializer
  def inititialize(sighting_object)
    @sighting = sighting_object
  end

  def to_serialized_json
    options = {
      include: {
        bird: { only: %i[name species] },
        location: { only: %i[latitude longitude] }
      },
      except: %i[updated_at]
    }
    @sighting.to_json(options)
  end
end
