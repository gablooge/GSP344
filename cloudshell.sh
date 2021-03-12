# #!/bin/bash

gcloud config set project $(gcloud projects list --format='value(PROJECT_ID)' --filter='qwiklabs-gcp')

# git clone https://github.com/rosera/pet-theory.git

gcloud app create --region=us-central

gcloud alpha firestore databases create --region=us-central

cd pet-theory/lab06/firebase-import-csv/solution
npm install
node index.js netflix_titles_original.csv
