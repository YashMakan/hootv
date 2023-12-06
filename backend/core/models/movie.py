from pydantic import BaseModel
from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Movie(Base):
    __tablename__ = "movies"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True)
    description = Column(String)

    @classmethod
    def from_imdb_api_data(cls, imdb_api_data):
        return cls(
            title=imdb_api_data.get("title"),
            description=imdb_api_data.get("description")
        )


class MovieIdRequest(BaseModel):
    movie_id: int
