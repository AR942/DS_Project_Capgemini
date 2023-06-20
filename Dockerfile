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
import re

def regrouper_urlc(colonne, dico_urlc, target_map_urlc):
    # Supprimer les caractères '|"' de la colonne
    colonne = colonne.apply(lambda x: re.sub(r'\|\"', '', x))
    
    # Créer un nouveau dictionnaire de correspondance d'urlc
    new_urlcdict = {i: k for k, v in dico_urlc.items() for i in v}
    
    # Mapper les valeurs de la colonne avec le nouveau dictionnaire
    colonne_mapped = colonne.str.findall('|'.join(new_urlcdict.keys())).str[0].map(new_urlcdict)
    
    # Remplacer les valeurs nulles par "Other"
    colonne_mapped.fillna('Other', inplace=True)
    
    # Mapper les valeurs de la colonne avec le dictionnaire de correspondance de la cible
    colonne_mapped = colonne_mapped.map(target_map_urlc)
    
    return colonne_mapped

# Exemple d'utilisation
data = pd.DataFrame({'urlc': ['keyword1|keyword2', 'keyword3|keyword4|keyword5', 'keyword6']})

testurl = pd.read_csv('notebooks/data/ML0001/Copie de urlc2.csv', sep='delimiter')
testurl = pd.DataFrame(testurl['urlc;Category'].str.split(';', expand=True))
testurl.rename(columns={0: 'keywords', 1: 'value'}, inplace=True)
dico_urlc = testurl.groupby("value")["keywords"].apply(list).to_dict()

target_map_urlc = {"Trisque": 3, "Prisque": 2, "PasRisque": 1, "Other": 0}

data['urlc_category'] = regrouper_urlc(data['urlc'], dico_urlc, target_map_urlc)

print(data)


