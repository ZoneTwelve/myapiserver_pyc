# Stage 1: Build the application
FROM python:3.10-slim AS builder

WORKDIR /app

# Copy the necessary files
COPY setup.py .
COPY requirements.txt .
COPY myapiserver ./myapiserver

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir .

# Compile Python files to .pyc
RUN python -m compileall -b /app/myapiserver

# Stage 2: Create the final image with only .pyc files
FROM python:3.10-slim

WORKDIR /app

# Copy only the .pyc files from the builder stage
COPY --from=builder /app/myapiserver/*.pyc ./myapiserver/
COPY --from=builder /app/myapiserver/api/*.pyc ./myapiserver/api/

# Install runtime dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set the Python path to include the current directory
ENV PYTHONPATH=/app

# Run the server
CMD ["python", "myapiserver/server.pyc"]