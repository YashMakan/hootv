from fastapi import APIRouter

from core.data_sources.reel_data_source import ReelDataSource
from core.models.reel import Reel

router = APIRouter(prefix='/medias')


@router.get("/trending")
async def fetch_medias():
    reels = ReelDataSource.fetch_reels()
    return {"result": list(map(lambda x: {
        'id': x,
        'url': "https://www.youtube.com/watch?v=" + x,
        'is_liked': False,
        'like_count': 0
    }, reels))}
