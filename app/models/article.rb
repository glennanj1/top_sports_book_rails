class Article < ApplicationRecord
    def self.create_articles
        @api_key = ENV["API_KEY"]
        url = URI("https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=#{@api_key}")
        res = Net::HTTP.get_response(url)
        parse = JSON.parse(res.body)
            parse['articles'].each do |x|
            title = x['title']
            name = x['name']
            description = x['description']
            url = x['url']
            url_to_image = x['urlToImage']
            content = x['content']

            a = Article.new(url_to_image: x['urlToImage'], title: title, name: name, description: description, url: url, content: content)  
            a.save
        end
    end
end
