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


regroupements = {
    'MIROVA UK': 'MIROVA',
    'BPCE-IT': 'BPCE',
    'BPCE INFOGERANCE ET TECHNOLOGIES': 'BPCE',
    'BPCE LEASE': 'BPCE',
    'BPCE FINANCEMENT': 'BPCE',
    'NATIXIS BANK JSC': 'NATIXIS',
    'NATIXIS IM UK LIMITED': 'NATIXIS',
    'NATIXIS LONDON BRANCH': 'NATIXIS',
    'NATIXIS NORTH AMERICA LLC': 'NATIXIS',
    'NATIXIS INVESTMENT MANAGERS INTERNATIONAL': 'NATIXIS',
    'NATIXIS IM, SUCURSAL EN ESPAÑA': 'NATIXIS',
    'NATIXIS - SUCURSAL EM PORTUGAL': 'NATIXIS',
    'CIB_London': 'NATIXIS'
}

import pandas as pd

def regrouper_colonne(colonne, regroupements, categories_conservees):
    # Appliquer les regroupements sur la colonne
    colonne_regroupee = colonne.apply(lambda x: regroupements.get(x, x))
    
    # Remplacer les catégories non conservées par "Other"
    colonne_regroupee = colonne_regroupee.apply(lambda x: x if x in categories_conservees else 'Other')
    
    return colonne_regroupee



categories_conservees = ['MIROVA', 'BPCE', 'NATIXIS']

data['raw_metier_regroupee'] = regrouper_colonne(data['raw_metier'], regroupements, categories_conservees)

print(data)

