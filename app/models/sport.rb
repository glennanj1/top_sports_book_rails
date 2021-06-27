class Sport < ApplicationRecord
    
    has_many :odds
    has_many :bets, through: :odds

    validates :title, uniqueness: true

    def self.create_sports
        url = URI("https://odds.p.rapidapi.com/v1/sports")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ENV['RAPIDAPI']
        request["x-rapidapi-host"] = 'odds.p.rapidapi.com'

        response = http.request(request)
        parse = JSON.parse(response.read_body)
        
        parse['data'].each do |x|
          keys = x['key']
          active = x['active']
          groups = x['group']
          detail = x['details']
          titles = x['title']
    
          s = Sport.new(key: keys, active: active, group: groups, details: detail, title: titles)
          if Sport.exists?(title: s.title) 
            sport = Sport.find_by(title: s.title)
            if sport.active != s.active 
              sport.update(active: s.active)
            else
              next
            end
          else
            s.save
          end
        end  
    end

end
