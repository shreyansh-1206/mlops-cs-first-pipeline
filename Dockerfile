#Pull the python image from DockerHub
#use a lightweight version of python to reduce the image size
FROM python:3.14-slim

#make a directory in the container to hold the code
WORKDIR /app
#copy depemdency list before copying the application code 
COPY requirements.txt . 

#Installl the dependencies
RUN pip install -r requirements.txt
 #Copy the application code and saved model inside /app

COPY . .

#Expose the port on which the application will run (same as the FAST API application)
EXPOSE 8000

#Start the api server when cotainer is ready
#0.0.0.0 allows connnections through the container's network interface, not just localhost

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]