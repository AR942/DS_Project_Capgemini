# weather-classification-deployment

test the python file (require correct python match):
python3 app.py

docker command to build the image:
docker build -t image .

docker command to launch the container on linux:
docker run -v $PWD/output:/weather-classification-app/output \                       
-v $PWD/test_images:/weather-classification-app/test_images image

on windows:
docker run -v C:\Users\smojt\Desktop\DS_Capgemini\input:/weather-classification-app/test_images -v C:\Users\smojt\Desktop\DS_Capgemini\output:/weather-classification-app/output image

-> if mkdir error, restart the docker desktop
