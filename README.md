# weather-classification-deployment

test the python file (require correct python match):
python3 app.py

docker command to build the image:
docker build -t image .

docker command to launch the container:
docker run -v $PWD/output:/weather-classification-app/output \                      
> -v $PWD/test_images:/weather-classification-app/test_images image
# weather-classification-deployment
