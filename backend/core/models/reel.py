from pydantic import BaseModel


class Reel(BaseModel):
    id: str = None
    url: str
    is_liked: bool = False
    like_count: int = 0

    @classmethod
    def from_json(cls, json_data):
        return cls(**json_data)

    def to_json(self):
        return self.dict()