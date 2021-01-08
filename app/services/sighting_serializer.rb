class SightingSerializer

    def initialize(sighting_object)
        @sighting = sighting_object
    end

    #will customize whatever we call it on and ready it to be sent as a JSON string
    def to_serialized_json
        #create/store a hash assigned to a local variable (options)
        options = {
            #1st hash key
            include: {
                bird: {
                    only: [:name, :species]
                },
                location: {
                    only: [:latitude, :longitude]
                }
            },
            #2nd hash key
            except: [:updated_at],
        }
        #Stringify's the options passed and calls that on the instance of sighting
        @sighting.to_json(options)
    end

end