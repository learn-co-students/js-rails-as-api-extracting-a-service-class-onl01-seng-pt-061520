class SightingSerializer

    def def initialize(sighting_object)
      @sighting_object = sighting_object
    end

    def to_serialized_json
        @sighting_object.json(:include => {
            :bird => {:only => [:name, :species]}.
            :location => {:only => [:latitude, :longitude]}
         } :except => [:updated_at])
    end

    # to make the to_serialized_json method cleaner
    
    def to_serialized_json2
        options = {
            include: {
                bird: {
                    only: [:name, :species]
                },
                location: {
                    only: [:latitude, :longitude]
                }
            },
            except: [:updated_at],
        }
        @sighting_object.to_json(options)
    end

     
end