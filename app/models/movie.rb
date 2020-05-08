class Movie < ApplicationRecord
    def self.all 
    @data ||= JSON.parse(File.read('movies.json')).map { |m| m.transform_keys(&:to_sym) }
  end 

  def self.recommend(movie_title)    
    recommender.item_recs(movie_title)
  end 

  private

  def self.recommender
    @recommender ||= begin
      recommender = Disco::Recommender.new(factors: 20)
      recommender.fit(Movie.all)

      recommender
    end
  end
end
