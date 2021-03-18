module BetsHelper
    def create_odds(key, id)
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
            site = []
            odd = []
            
            sites = x['sites'].map do |y|
              site << "Book: #{y['site_nice']} Odds: #{y['odds']['h2h'][0]} #{y['odds']['h2h'][1]} #{y['odds']['h2h'][2]}"
            end

            odds = x['sites'].map do |y|
                odd << "#{y['odds']['h2h']}"
            end

          
            
            @bet = Bet.new()

        end 
    end
end