class Review < ApplicationRecord

    validates :review_id, uniqueness: true
    validates :rating, presence: true
    validates :text, presence: true
   
    
    def self.get_reviews 
        response = HTTP.auth("Bearer #{ENV['YELP']}").get("https://api.yelp.com/v3/businesses/ye0SMF2yZ8D9_ABXcKSa-Q/reviews")
        data = response.parse 
        data['reviews'].each do |x| 
            id = x['id']
            rating = x['rating']
            user_id = x['user']['id']
            profile_url = x['user']['profile_url']
            image_url = x['user']['image_url']
            name = x['user']['name']
            text = x['text']
            time_created = x['time_created']
            url = x['url']
            if name = "Robert P."
                next
            end
            r = Review.new(review_id: id, rating: rating, user_id: user_id, profile_url: profile_url, image_url: image_url, name: name, text: text, time_created: time_created, url: url) 
            r.save
        end
    end

end
