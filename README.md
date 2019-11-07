# Sample-Node-API with MongoDB Database on 5 Node Kubernetes Cluster:

IMPORTANT NOTES:
- The Kubernetes cluster used for the demonstration was hosted on a 5 node VM cluster.(With reference from the Github guides by Kelsey Hightower & Mumshad Mannambeth)
- Virtual Box on MAC machine was used to virtualize 5 Ubuntu bionic VMs using vagrant tool.
- MAC Terminal used as an ssh client to login to the VMs and conduct the given tasks:
- The K8s cluster was setup referring to the guide by Kelsey Hightower on GitHub.


Step 1 - First generate the yaml file for Persistent Volumes & Persistent Volume Claims. Create the required persistent volumes & persistent volume claims.
 
    kubectl create -f pv_pvc.yaml

Step 2 - Create a secret object and pass the key and values using the following command:

    kubectl create secret generic --from-literal=DB_HOST=localhost --from-literal=DB_PORT=27017 --from literal=DB_DATABASE=sample --from-literal=DB_USERNAME=sample --from-literal=DB_PASSWORD=any_password@123

Step 3 - Create the prerequisite objects to so that they can be used by the Ingress Resource we create at a later step:

   Namespace : 
    
    kubectl create namespace ingress-space
   
   Configmaps: 
   
    kubectl create configmap nginx-configuration -n ingress-space
   
   Serviceaccount: 
   
    kubectl create serviceaccount ingress-serviceaccount -n ingress-space

   Roles & RoleBindings 
    
    kubectl create -f rbac.yaml

   ClusterRoles : 
   
    kubectl create -f ingress-clusterrole.yaml

   ClusterRoleBindings: 
   
    kubectl create -f ingress-clusterrolebinding.yaml


Step 4 - Create the mongo service using the following command:

    kubectl create -f mongodb-service.yaml
 
Step 5 - Now generate a YAML file for the MongoDB deployment. The container mounts the persistent volume claim we created earlier. Note that we are labelling the pods with ‘name: mongo’, so that the service we created in the previous step applies to the deployment:

    kubectl create -f mongodb.yaml
 
Step 6 - We now generate an external NodePort service YAML file that external users can use to access the NodeApi Deployment, and create the service oject for the same:

    kubectl create -f nodeapi-service.yaml
 
Step 7 - Generate a YAML file for the sample-node-api Deployment and create an object for the same:

    kubectl create -f nodeapi.yaml
 
   NOTE : We shall now be able to verify our deployments are up and running using the following command :
   
    kubectl get all --all-namespaces
   
Step 8 - Now go ahead with the creation of the Ingress Controller deployment object:

    kubectl create -f ingress-controller.yaml
   
Step 9 - Now create the Ingress service object to make the Ingress Controller accessible by the end users.

    kubectl create -f ingress-service.yaml
   
Step 10 - Finally create the Ingress Resource object that will include the backend service and service port to which the traffic will point to i.e the sample-node-api (WEB deployment).

    kubectl create -f ingress-resource.yaml

Step 11- Once again verify if all objects created are up and running, and if any objects are not missing:

    kubectl get all --all-namespaces
    kubectl get services --all-namespaces
    kubectl get pv,pvc
    kubectl get secrets,configmaps --all-namespaces
    kubectl get serviceaccounts --all-namespaces
 
 

