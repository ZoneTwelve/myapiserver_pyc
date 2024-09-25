from setuptools import setup, find_packages

setup(
    name="myapiserver",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "fastapi",
        "uvicorn",
    ],
    python_requires=">=3.10",
    entry_points={
        "console_scripts": [
            "myapiserver=myapiserver.server:run",
        ],
    },
)