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

We also have:
- An app.py containing the python code for loading and preprocessing of images, for loading of our classification model and to make predictions on the images and export them
- A dockerfile containng all the instructions required to build our functional image

## 3) Compilation process
### a) Way to start - Initialization

In your own computer, create a local folder containing 3 folders:
- input : contains the .jpg images for testing
- output : where the .csv output of predictions will go (but you don't create the .csv, indeed this folder create automatically)
- model : contains the classification model ResNet152V2-Weather-Classification-03.h5

To Resume, you must create a folder (<name_of_the_folder_created_in_init>) and in this folder, create 3 new folders. In the 1st folder (input), put your imafes (in .jpg) who you want to test. In the 2nd folder (output), you put anything. In the last folder (model), put the classification model "ResNet152V2-Weather-Classification-03.h5"

Do not lose sight of the path of your folder that you have created for the occasion in order to use it in the deployment. 

We have for example "test_images" which you can use some images but we decided to use more in our case

### b) Run the project
#### weather-classification-app using docker for deployment
To run the project and build the image containing all the requirements needed and our project, Docker command is:
> docker build -t image .

To launch the container with volume mapping on the local folder, Docker command is :
On Linux:
> docker run -v /Users/<name_of_user>/Desktop/<name_of_the_folder_created_in_init>/output:/weather-classification-app/output \
> -v /Users/<name_of_user>/Desktop/<name_of_the_folder_created_in_init>/input:/weather-classification-app/test_images \
> -v /Users/<name_of_user>/Desktop/<name_of_the_folder_created_in_init>/model:/weather-classification-app/model image

On Windows:
> docker run -v C:\Users\<name_of_user>\Desktop\<name_of_the_folder_created_in_init>\input:/weather-classification-app/test_images -v C:\Users\<name_of_user>\Desktop\<name_of_the_folder_created_in_init>\output:/weather-classification-app/output -v C:\Users\<name_of_user>\Desktop\<name_of_the_folder_created_in_init>\model:/weather-classification-app/model image

These commands depend on where you have created your project. 

Troubleshoot : if mkdir error, simply restart the docker desktop and try again

Finally you should get in the "output" folder of "ds-capgemini" (<name_of_the_folder_created_in_init>) folder:
- A csv file (with timestamp in filename) with two columns : "image_name" for the name of the image and "prediction_label" for the predicted class of this image
- A visual plot of the predictions to get a first visual idea of the performance of the Deep Learning model : if mkdir error, simply restart the docker desktop and try again
