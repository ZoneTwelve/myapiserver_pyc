from fastapi import FastAPI
from .api import user

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello world"}

app.include_router(user.router, prefix="/api")

def run():
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)

if __name__ == "__main__":
    run()
