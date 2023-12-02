import requests
from ezflix import Ezflix


class EzflixDaraSource:
    @staticmethod
    def fetch_movie_torrents(term: str, limit=5):
        ezflix = Ezflix(query=term, media_type='movie', limit=limit)
        movies = ezflix.search()
        return list(map(lambda x: x['link'], movies))

    @staticmethod
    def fetch_torrent_bytes(torrent_url: str):
        response = requests.get(torrent_url)
        return response.content
