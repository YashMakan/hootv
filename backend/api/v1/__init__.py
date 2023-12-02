from fastapi import APIRouter
from api.v1.endpoints import movie, tvshow, reels

router = APIRouter(prefix='/v1')

router.include_router(movie.router)
router.include_router(tvshow.router)
router.include_router(reels.router)
