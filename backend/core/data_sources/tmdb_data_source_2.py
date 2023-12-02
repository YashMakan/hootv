import os
from typing import List

from tmdbv3api import Movie as TdbMovie, Search
from tmdbv3api import TMDb
from dotenv import load_dotenv

# from core.models.movie import Movie
load_dotenv()
tmdb = TMDb()
tmdb.api_key = os.getenv('TMDB_API_KEY', 'e4d1a676ddbe38a22e41b08dbafb52aa')


class TmdbDataSource:
    def __init__(self):
        pass

    @staticmethod
    def fetch_trending_movies():
        movie = TdbMovie()
        movies = movie.popular()
        return list(map(lambda x: dict(x), dict(movies)['results']))

    @staticmethod
    def fetch_new_movies():
        movie = TdbMovie()
        movies = movie.now_playing()
        return list(map(lambda x: dict(x), dict(movies)['results']))

    @staticmethod
    def search_movie(term: str):
        search = Search()
        movies = search.movies(term)
        return list(map(lambda x: dict(x), dict(movies)['results']))

    @staticmethod
    def fetch_movie_info(movie_id: int):
        movie = TdbMovie()
        movie_info = movie.details(movie_id)
        return movie_info
