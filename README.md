# weather-classification-deployment



docker command to build the image:
docker build -t image .

docker command to launch the container on linux:
> docker run -v /Users/arthusrouhi/Desktop/ds-capgemini/output:/weather-classification-app/output \
> -v /Users/arthusrouhi/Desktop/ds-capgemini/input:/weather-classification-app/test_images \
> -v /Users/arthusrouhi/Desktop/ds-capgemini/model:/weather-classification-app/model image

on windows:
> docker run -v C:\Users\smojt\Desktop\DS_Capgemini\input:/weather-classification-app/test_images -v C:\Users\smojt\Desktop\DS_Capgemini\output:/weather-classification-app/output -v C:\Users\smojt\Desktop\DS_Capgemini\model:/weather-classification-app/model image

-> if mkdir error, restart the docker desktop
