from typing import Optional

from fastapi import APIRouter

from core.data_sources.ezflix_data_source import EzflixDaraSource
from core.data_sources.tmdb_data_source import TmdbDataSource

router = APIRouter(prefix='/tv-show')
movieSource = TmdbDataSource


@router.get("/trending")
async def movie_trending():
    shows = movieSource().fetch_trending_tv_shows()
    return {"result": shows}

#
# @router.get("/new")
# async def movie_new():
#     movies = movieSource.fetch_new_movies()
#     return {"result": movies}
#
#
# @router.get("/categories")
# async def movie_trending():
#     return {"ping": "pong!"}
#
#
# @router.get("/search")
# async def movie_search(term: str):
#     movies = movieSource.search_movie(term)
#     return {"result": movies}
#
#
# @router.get("/info")
# async def movie_info(movie_id: int):
#     movie = movieSource.fetch_movie_info(movie_id)
#     return {"result": movie}
#
#
# @router.get("/check-availability")
# async def movie_check_availability(term: str, limit: Optional[int]):
#     movie_torrent_links = EzflixDaraSource.fetch_movie_torrents(term, limit=limit)
#     return {"result": len(movie_torrent_links) > 0, "movie_torrent_links": movie_torrent_links}
#
#
# @router.get("/fetch")
# async def movie_torrent_bytes(torrent_url: str):
#     torrent_bytes = EzflixDaraSource.fetch_torrent_bytes(torrent_url)
#     # update in db
#     return torrent_bytes
