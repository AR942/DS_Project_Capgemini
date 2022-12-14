FROM python:3.10.8

# set working directory
WORKDIR /weather-classification-app 

#copy all required files to docker
COPY . ./ 

RUN pip3 install --upgrade pip
COPY requirements.txt requirements.txt

#create the output directory
RUN mkdir -p /weather-classification-app/output 
#create the test directory
RUN mkdir -p /weather-classification-app/test_images 
RUN pip3 install -r requirements.txt


CMD ["python", "app.py"]