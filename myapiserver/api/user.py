from fastapi import APIRouter

router = APIRouter()

@router.get("/user")
async def get_user(username: str):
    return {"message": f"Hello {username}"}