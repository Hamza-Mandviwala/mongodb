# mongodb
Create the required persistent volumes & persistent volume claims.
#kubectl create -f pv&pvc.yaml

Create a secret object and pass the key and values using the following command:

 #kubectl create secret generic --from-literal=DB_HOST=localhost --from-literal=DB_PORT=27017 --from-literal=DB_DATABASE=sample --from-literal=DB_USERNAME=sample --from-literal=DB_PASSWORD=any_password@123

Create the respective service objects files using the files attached to this project in the following order:
1 - mongodb service
2 - mongodb deployment
3 - node-api service
4 - node-api deployment

Create the mongo service using the following command:
 #kubectl create -f mongodb-service.yaml
 
Now generate a YAML file for the MongoDB deployment. The container mounts the persistent volume claim we created earlier. Note that we are labelling the pods with ‘name: mongo’, so that the service we created in the previous step applies to the deployment:
 #kubectl create -f mongodb.yaml
 
We now generate an external NodePort service YAML file that external users can use to access the NodeApi Deployment, and create the service oject for the same:
 #kubectl create -f nodeapi-service.yaml
 


