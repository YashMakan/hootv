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
