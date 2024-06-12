# booksearch
DockerHub image repository: https://hub.docker.com/repository/docker/rgb234/book_search/general <br></br>

This project was created to simulate a client-server architecture operating on a container environment. \
client : booksearch (flutter) , server : book_api (https://github.com/RGB234/book_api) (express.js) \

the Books_Api class (lib/api/books_api.dart) sends HTTP request to the server (server source code : https://github.com/RGB234/book_api) \

## How to run the server and clients

* Option A (Kubernetes)

Use .yaml files in /k8s_yaml  

Creating two Pods  
(https://hub.docker.com/r/rgb234/book_search/tags), (https://hub.docker.com/repository/docker/rgb234/book_api/general)  
```
> kubectl apply -f book-search.yml
```
Creating a kubernetes Service
```
> kubectl apply -f my-service.yml
```

* Option B (local PC)  

Start the server (https://github.com/RGB234/book_api/)  
```
> node main.js
```
Flutter run (https://github.com/RGB234/booksearch)  
```
> flutter run -d chrome
```

## Output Screen

<img src="https://github.com/RGB234/booksearch/assets/67996767/90c2e340-27cd-4ef5-a52a-2c09474baf8d" width="50%" height="50%">

