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


data['raw_metier'] = data['raw_metier'].apply(lambda x: regroupements.get(x, x))

categories_autres = data['raw_metier'].unique()
categories_conservees = ['MIROVA', 'BPCE', 'NATIXIS']

data['raw_metier'] = data['raw_metier'].apply(lambda x: x if x in categories_conservees else 'Other')

repartition = data['raw_metier'].value_counts().reset_index()
repartition.columns = ['raw_metier', 'count']
