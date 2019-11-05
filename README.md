# mongodb
Create the required persistent volumes & persistent volume claims.

Create a secret object and pass the key and values using the following command:

# kubectl create secret generic --from-literal=DB_HOST=localhost --from-literal=DB_PORT=27017 --from-literal=DB_DATABASE=sample --from-literal=DB_USERNAME=sample --from-literal=DB_PASSWORD=any_password@123

Create the respective service objects files using the files attached to this project in the following order:
1 - mongodb service
2 - mongodb deployment
3 - node-api service
4 - node-api deployment

