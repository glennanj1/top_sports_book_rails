class Odd < ApplicationRecord
    belongs_to :sport 
    has_many :bets 
    has_many :users, through: :bets

    validates :commence_time, uniqueness: true
    accepts_nested_attributes_for :bets

    def odds_selection
        odds = JSON[self.odds]
        odds_list = odds.map { |o| o[0]}
        odds_list1 = odds.map { |o| o[1] }
        odds_selection = odds_list.concat odds_list1
    end

    def self.create_odds(key, id)
        url = URI("https://odds.p.rapidapi.com/v1/odds?sport=#{key}&region=us&mkt=h2h&dateFormat=iso&oddsFormat=american")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ENV['RAPIDAPI']
        request["x-rapidapi-host"] = 'odds.p.rapidapi.com'

        response = http.request(request)
        parse = JSON.parse(response.read_body)
        
        parse['data'].each do |x|
            sport_id = id
            sport_key = x['sport_key']
            sport_nice = x['sport_nice']
            teams = "#{x['teams'][0]} vs #{x['teams'][1]}"
            home_team = x['home_team']
            
            commence_time = x['commence_time']
            site = []
            odd = []
            
            sites = x['sites'].map do |y|
              site << "Book: #{y['site_nice']} Odds: #{y['odds']['h2h'][0]} #{y['odds']['h2h'][1]} #{y['odds']['h2h'][2]}"
            end

            odds = x['sites'].map do |y|
                odd << y['odds']['h2h']
            end

            o = Odd.new(sport_id: sport_id, sport_key: sport_key, sport_nice: sport_nice, teams: teams, home_team: home_team, commence_time: commence_time, site_and_odds: site, odds: odd)
            o.save

        end 
    end


    
end
