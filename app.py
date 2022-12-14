"""remove tensorflow & keras warning informations"""
import logging
logging.getLogger("tensorflow").setLevel(logging.WARNING)

import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'  #or {'0', '1', '2'}

# Common
import keras
import numpy as np
import pandas as pd
from glob import glob
from tqdm import tqdm

import warnings
warnings.filterwarnings("ignore")
# Data


import tensorflow
tensorflow.autograph.set_verbosity(1)

#from tensorflow import resize
from sklearn.model_selection import StratifiedShuffleSplit
from tensorflow.keras.utils import load_img, img_to_array

# Data Viz
import seaborn as sns
import matplotlib.pyplot as plt


# TL Model
from tensorflow.keras.applications import ResNet50, ResNet50V2, InceptionV3, Xception, ResNet152, ResNet152V2

# Model
from keras import Sequential
from keras.layers import Dense, GlobalAvgPool2D, Dropout
from keras.models import load_model

# Callbacks 
from keras.callbacks import EarlyStopping, ModelCheckpoint

# Model Performance
from sklearn.metrics import classification_report

# Model Viz
from tensorflow.keras.utils import plot_model

print("WEATHER PREDICTION")

# These are the possible categories (classes) which can be detected
class_names = {0: 'cloudy', 1: 'foggy', 2: 'rainy', 3: 'shine', 4: 'sunrise'}


"""app = Flask(__name__)"""

"""@app.route("/", methods=['GET', 'POST'])                 #initialising
def home():                                              #function call

    return render_template('home.html')    """              #return and calling HTML page (designed template)



def load_image(path):
    '''
    Takes in path of the image and load it
    '''
    img = tensorflow.image.resize(img_to_array(load_img(path))/255., (256,256))
    return img


def show_image(image, title=None):
    '''
    Takes in an Image and plot it with Matplotlib
    '''
    plt.imshow(image)
    plt.title(title)
    plt.axis('off')


def load_data(img_paths):
    X = np.zeros(shape=(len(img_paths), 256,256,3))

    for i, path in tqdm(enumerate(img_paths), desc="Loading"):
        X[i] = load_image(path)
    
    return X

image_paths = sorted(glob('test_images/*.jpg'))
print(f"Total Number of Images to Predict : {len(image_paths)}")

images = load_data(image_paths)

plt.figure(figsize=(10,10))
for i in range(25):
    
    if i > len(images)-1:
        break
    
    image = images[i]

    plt.subplot(5,5,i+1)
    show_image(image, title=f"Image : {i}")
    
plt.tight_layout()
plt.draw()

# Load model
model_v3 = load_model('model/ResNet152V2-Weather-Classification-03.h5')

# Make Predictions
preds = np.argmax(model_v3.predict(images), axis=-1)
print(preds)

plt.figure(figsize=(15,20))
for i, im in enumerate(images):

    # Make Prediction
    pred = class_names[list(preds)[i]]
    
    # Show Prediction
    plt.subplot(5,5,i+1)
    show_image(im, title=f"Pred : {pred}")
    print(pred)
    
    
plt.tight_layout()
plt.draw()

plt.show()


import datetime
import os

"""mapping the prediction with the corresponding class_name weather"""
preds.tolist()


def get_pred(preds: list):
    
    return [class_names[pred] for pred in preds]

prediction_label = get_pred(preds)
prediction_label

"""predictions to dataframe"""
prediction_final = pd.DataFrame({"image_name": image_paths, "prediction_label": prediction_label})
prediction_final

"""the actual date and the path we want the csv in"""
date =  datetime.datetime.now().strftime("%Hh%M_%d-%m-%Y")
path = "output"
"""store the prediction to .csv file in the output path"""
prediction_final.to_csv(os.path.join(path, "output-"+ date +".csv"))


"""other method using csv library"""

"""
import csv
import datetime

rows = zip(image_paths, prediction_label)
date =  datetime.datetime.now().strftime("%Hh%M_%m-%d-%Y")
columns = ["image_name", "prediction_label"]
"""
"""write a csv file with datetime countaining the output"""
"""
with open("output/output-" + date + ".csv", 'w') as csvfile:
    write = csv.writer(csvfile)

    write.writerow(columns)

    for row in rows:
        write.writerow(row)
"""
