from fastapi import APIRouter
from pydantic import BaseModel

from core.data_sources.tmdb_data_source import TmdbDataSource

router = APIRouter(prefix='/medias')


@router.get("/trending")
async def fetch_medias():
    medias = TmdbDataSource().fetch_all_trending_media()
    return {"result": medias}


class SearchRequest(BaseModel):
    query: str


@router.post("/search")
async def search_medias(req: SearchRequest):
    medias = TmdbDataSource().search_media(req.query)
    return {"result": medias}
