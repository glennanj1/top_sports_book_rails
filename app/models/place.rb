class Place < ApplicationRecord
    validates :name, uniqueness: true

    def self.get_place(zip)
        location = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{zip}&key=#{ENV['GOOGLE']}")
        @cords = location['results'][0]['geometry']['location'].each do |x,y|
            coordinates = []
            coordinates.push(y)
        end

        results = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@cords['lat']},#{@cords['lng']}&radius=5000&type=park&keyword=dogpark&key=#{ENV['GOOGLE']}")

        results['results'].map do |x|
            bs = x['business_status'] 
            i = x['icon'] 
            n = x['name'] 
            p = x['photos'] 
            pi = x['place_id'] 
            r = x['rating'] 
            rc = x['reference']
            ur = x['user_ratings_total']  
            v = x['vicinity'] 
           place = Place.new(business_status: bs, icon: i, name: n, photos: p, place_id: pi, rating: r, reference: rc, user_rating_total: ur, vicinity: v, zip: zip)
           place.save
        end
    end
end
