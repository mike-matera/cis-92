# My CIS-92 Project 

This repository has the starter code for CIS-92. 

This is my project.


# Configuration

## The variables from config.yaml

| Variable Name | Default Value | Description |
| --- | --- | --- | 
|  Port | 8000 | The port number used for the application | 
| Student_Name | Luis | Name of the user | 
| Site_Name | "*" | Name of the site | 
| Data_Dir | /data | Where the data is located | 
| Debug | "1" | Debug is enabled | 

### The variables from secret.yaml
| Variable Name | Default Value | Description |
|---|---|---|
| SECRET_KEY | Abc123** | text key to securing signed data |
| POSTGRES_USER | mysiteuser | PostgresSQL user name |
| POSTGRES_PASSWORD | Abc123** | PostgresSQL password |
| POSTGRES_DB | mysite | Name of postgres DB|

#### Primary Resources Requests
| Resource | Default Value | Description |
| --- | --- | --- |
| memory| 512Mi | Minimum memory | 
| cpu | 500m | Minimum CPU |
| ephemeral-storage | 100Mi | Minimum storage|

#### Primary Resource Limits
| Resource | Default Value | Description |
| --- | --- | --- |
|memory | 512Mi |
|cpu | 500m |
|ephemeral-storage | 100Mi |





### Create your workspace!

cd **to desire directory**

###
git clone git@github.com:RadioKame/cis-92.git

### make sure your cluster is up and running ###

kubectl get all



### Start up commands
kubectl apply -f deployment/

### Initilize Database and set username password(we open a shell in the pod)
kubectl exec --stdin --tty pod/mysite-pod -- /bin/bash




### run in it:

python manage.py migrate

python manage.py createsuperuser

exit

If failing, basic troubleshoot is ok, just don't stress the system or try troubleshoot outside

### check the app using the external IP

:D


### Delete the Kubernetes pod (keep the bill low)
kubectl delete -f deployment/


### try

kubectl get all




This repository has the starter code for CIS-92. 

By: Luis Garcia




Author: Luis Garcia, CIS-92 starts now 02/14/24
