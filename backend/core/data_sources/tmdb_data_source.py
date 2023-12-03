import os

from dotenv import load_dotenv

from core.data_sources.tmdb_api import TmdbApi

load_dotenv()

api_key = os.getenv('TMDB_API_KEY', 'e4d1a676ddbe38a22e41b08dbafb52aa')


class TmdbDataSource:
    def __init__(self):
        self.api = TmdbApi(api_key)

    def fetch_trending_movies(self):
        response = self.api.request('movie/popular', method='GET', params={'api_key': api_key})
        return list(map(lambda x: dict(x), response['results']))

    def fetch_new_movies(self):
        response = self.api.request('movie/now_playing', method='GET', params={'api_key': api_key})
        return list(map(lambda x: dict(x), response['results']))

    def search_movie(self, term: str):
        response = self.api.request('search/movie', method='GET', params={'api_key': api_key, 'query': term})
        return list(map(lambda x: dict(x), response['results']))

    def fetch_movie_info(self, movie_id: int):
        response = self.api.request(f'movie/{movie_id}', method='GET', params={'api_key': api_key})
        return dict(response)

    def fetch_movie_videos(self, movie_id: int):
        response = self.api.request(f'movie/{movie_id}/videos', method='GET', params={'api_key': api_key})
        return dict(response)

    def fetch_trending_tv_shows(self):
        response = self.api.request(
            'trending/tv/week',
            # 'discover/tv',
            method='GET',
            params={
                'api_key': api_key,
                'language': 'en-US',
            }
            # params={'api_key': api_key, 'include_null_first_air_dates': 'false', 'language': 'en-US', 'page': '1',
            #         'sort_by': 'popularity.asc'},
        )
        results = list(map(lambda x: dict(x), response['results']))
        return list(filter(lambda item: item.get("media_type") != "person", results))

    def fetch_all_trending_media(self, time_window='day'):
        response = self.api.request(f'trending/all/{time_window}', method='GET',
                                    params={'api_key': api_key, 'language': 'en-US'})
        return list(map(lambda x: dict(x), response['results']))

    def search_media(self, query: str):
        response = self.api.request(f'search/multi', method='GET',
                                    params={'api_key': api_key, 'language': 'en-US', 'query': query.replace(' ', '%20')})

        results = list(map(lambda x: dict(x), response['results']))
        return list(filter(lambda item: item.get("media_type") != "person", results))
