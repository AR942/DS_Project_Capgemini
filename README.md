# weather-classification-deployment


Create a local folder containing 3 folders:
- input : contains the .jpg images for testing
- output : where the .csv output of predictions will go
- model : contains the classification model ResNet152V2-Weather-Classification-03.h5

docker command to build the image:
docker build -t image .

docker command to launch the container on linux with volume mapping on the local folder:

on linux:
> docker run -v /Users/arthusrouhi/Desktop/ds-capgemini/output:/weather-classification-app/output \
> -v /Users/arthusrouhi/Desktop/ds-capgemini/input:/weather-classification-app/test_images \
> -v /Users/arthusrouhi/Desktop/ds-capgemini/model:/weather-classification-app/model image

on windows:
> docker run -v C:\Users\smojt\Desktop\DS_Capgemini\input:/weather-classification-app/test_images -v C:\Users\smojt\Desktop\DS_Capgemini\output:/weather-classification-app/output -v C:\Users\smojt\Desktop\DS_Capgemini\model:/weather-classification-app/model image

-> if mkdir error, simply restart the docker desktop and try again
