# Documentation :
## 1) Subject Explications and Objectives

The purpose of this project is to industrialize a **Datascience model** through **containerization**.

In order to achieve this goal, we had to first convert the Jupyter notebook into a python script. Only then were we able to build a **Docker container**.

This Docker container must meet the following criteria:
- must contain Python, python scripts and required packages
- a volume mapping on an input directory and an other one on an output directory in the local filesystem

## 2) Description of the conception and implementation

To begin, we use and test the notebook "weather-classification-TP.ipynb" who include imports libraries, the predictions and 
All of libraries use in  must be call in the "requirements" if we would like a run of the app.py
To create the requirements by using "PyCharm", from Tools Menu, select sync Python Requirements. We have a opened dialog, specify the name of requirements file and use the compatible version.



## 3) Compilation process
### a) Way to start - Initialization

In your own computer, create a local folder containing 3 folders:
- input : contains the .jpg images for testing
- output : where the .csv output of predictions will go
- model : contains the classification model ResNet152V2-Weather-Classification-03.h5

Do not lose sight of the path of your folder that you have created for the occasion in order to use it in the deployment. 

We have for example "test_images" which you can use some images but we decided to use more in our case

### b) Run the project
#### weather-classification-app using docker for deployment
To run the project and build the image containing all the requirements needed and our project, Docker command is:
> docker build -t image .

To launch the container with volume mapping on the local folder, Docker command is :
On Linux:
> docker run -v /Users/<name_of_user>/Desktop/ds-capgemini/output:/weather-classification-app/output \
> -v /Users/<name_of_user>/Desktop/ds-capgemini/input:/weather-classification-app/test_images \
> -v /Users/<name_of_user>/Desktop/ds-capgemini/model:/weather-classification-app/model image

On Windows:
> docker run -v C:\Users\<name_of_user>\Desktop\DS_Capgemini\input:/weather-classification-app/test_images -v C:\Users\<name_of_user>\Desktop\DS_Capgemini\output:/weather-classification-app/output -v C:\Users\<name_of_user>\Desktop\DS_Capgemini\model:/weather-classification-app/model image

These commands depend on where you have created your project. 

Note Bene : if mkdir error, simply restart the docker desktop and try again
