FROM python:3.10.8

#set the working directory
WORKDIR /weather-classification-app 

#copy all required local files to docker container
COPY . ./ 

#upgrade python's pip version
RUN pip3 install --upgrade pip
COPY requirements.txt requirements.txt

#create the output directory
RUN mkdir -p /weather-classification-app/output 
#create the test directory
RUN mkdir -p /weather-classification-app/test_images 
RUN pip3 install -r requirements.txt

#Instruction that is to be executed when the docker container starts
CMD ["python", "app.py"]
