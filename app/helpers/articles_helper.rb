module ArticlesHelper

    def article(id)
        Article.find_by(id: id)
    end



end
