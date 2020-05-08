class MoviesController < ApplicationController
    def index
    recommendations = Movie.recommend(params[:movie_title])

    render json: recommendations, status: :ok
  end
end
