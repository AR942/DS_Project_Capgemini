# Documentation :
## 1) Subject Explications and Objectives

The purpose of this project is to industrialize a **Datascience model** through **containerization**.

In order to achieve this goal, we had to first convert the Jupyter notebook into a python script. Only then were we able to build a **Docker container**.

This Docker container must meet the following criteria:
- must contain Python, python scripts and required packages
- a volume mapping on an input directory and an other one on an output directory in the local filesystem

## 2) Description of the conception and implementation

## 3) Compilation process
### a) Way to start - Initialization


### b) Run the project
#### weather-classification-app using docker for deployment

Create a local folder containing 3 folders:
- input : contains the .jpg images for testing
- output : where the .csv output of predictions will go
- model : contains the classification model ResNet152V2-Weather-Classification-03.h5

docker command to build the image containing all the requirements needed and our project:
> docker build -t image .

docker command to launch the container on linux with volume mapping on the local folder:

on linux:
> docker run -v /Users/arthusrouhi/Desktop/ds-capgemini/output:/weather-classification-app/output \
> -v /Users/arthusrouhi/Desktop/ds-capgemini/input:/weather-classification-app/test_images \
> -v /Users/arthusrouhi/Desktop/ds-capgemini/model:/weather-classification-app/model image

on windows:
> docker run -v C:\Users\smojt\Desktop\DS_Capgemini\input:/weather-classification-app/test_images -v C:\Users\smojt\Desktop\DS_Capgemini\output:/weather-classification-app/output -v C:\Users\smojt\Desktop\DS_Capgemini\model:/weather-classification-app/model image

-> if mkdir error, simply restart the docker desktop and try again
