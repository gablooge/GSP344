# #!/bin/bash

gcloud config set project $(gcloud projects list --format='value(PROJECT_ID)' --filter='qwiklabs-gcp')

# git clone https://github.com/rosera/pet-theory.git

gcloud app create --region=us-central

gcloud alpha firestore databases create --region=us-central

cd pet-theory/lab06/firebase-import-csv/solution
npm install
node index.js netflix_titles_original.csv

PROJECT_ID=$(gcloud config get-value project)

cd ../../firebase-rest-api/solution-01/
gcloud builds submit --tag gcr.io/$PROJECT_ID/rest-api:0.1
cd ../../firebase-rest-api/solution-02/
gcloud builds submit --tag gcr.io/$PROJECT_ID/rest-api:0.2
cd ../../firebase-frontend/
gcloud builds submit --tag gcr.io/$PROJECT_ID/frontend-staging:0.1
gcloud builds submit --tag gcr.io/$PROJECT_ID/frontend-production:0.1

gcloud run deploy --image gcr.io/$PROJECT_ID/rest-api:0.1

 # 1
 # netflix-dataset-service
 # 18
 # y


# gcloud run deploy --image gcr.io/$PROJECT_ID/rest-api:0.2
# 1
# netflix-dataset-service
# 18
# y

# gcloud run deploy --image gcr.io/$PROJECT_ID/frontend-staging:0.1
# 1
# frontend-staging-service
# 18
# y

# edit public/app.js
# gcloud builds submit --tag gcr.io/$PROJECT_ID/frontend-production:0.1
# gcloud run deploy --image gcr.io/$PROJECT_ID/frontend-production:0.1
# 1
# frontend-production-service
# 18
# y