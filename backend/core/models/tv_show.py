from pydantic import BaseModel


class TvShowIdRequest(BaseModel):
    tv_show_id: int
