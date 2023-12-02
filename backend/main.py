# from core.db import database
from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware
from api import v1
import uvicorn

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["DELETE", "GET", "POST", "PUT"],
    allow_headers=["*"],
)


# @app.on_event("startup")
# async def startup():
#     await database.connect()
#
#
# @app.on_event("shutdown")
# async def shutdown():
#     await database.disconnect()


app.include_router(v1.router)

if __name__ == "__main__":
    uvicorn.run(app)
