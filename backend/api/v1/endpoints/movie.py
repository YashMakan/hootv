from fastapi import APIRouter

from core.data_sources.tmdb_data_source import TmdbDataSource
from core.models.movie import MovieIdRequest

router = APIRouter(prefix='/movies')
movieSource = TmdbDataSource


@router.get("/trending")
async def movie_trending():
    print()
    movies = movieSource().fetch_trending_movies()
    return {"result": movies}


@router.get("/new")
async def movie_new():
    movies = movieSource().fetch_new_movies()
    return {"result": movies}


@router.post("/videos")
async def fetch_movie_videos(request: MovieIdRequest):
    videos = movieSource().fetch_movie_videos(request.movie_id)
    return {"result": videos}


@router.post("/info")
async def fetch_movie(request: MovieIdRequest):
    result = movieSource().fetch_movie_info(request.movie_id)
    return {"result": result}


@router.post("/credits")
async def fetch_movie(request: MovieIdRequest):
    result = movieSource().fetch_movie_credits(request.movie_id)
    return {"result": result}
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
