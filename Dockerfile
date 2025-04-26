FROM python:3.8-slim
 
# Set a working directory in the container

WORKDIR /usr/ML/app
 
# Copy everything into the container

COPY . .
 
# Install dependencies

RUN pip install --no-cache-dir -r requirements.txt
 
# Expose the Flask port

EXPOSE 5000
 
# Train the model before serving (optional: comment out if already trained and logreg.pkl exists)

RUN python ml_train.py
 
# Start the Flask web API

CMD ["python", "flask_web_api.py"]
