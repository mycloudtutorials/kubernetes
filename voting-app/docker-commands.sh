# We will download the images from docker. Please create a free account at https://hub.docker.com/

# On the terminal window, run (if not already logged in)
docker login

# Run the following docker commands to download the images and run them
#1 Run the Redis container
docker run -d --name=redis redis

#2 Run the Postgres Sql Db container
docker run -d --name=db postgres:9.4

#3 Create the voting front-end app
docker run -d --name=vote --link redis:redis -p 5000:80 dockersamples/examplevotingapp_vote

#4 Create the result front-end app
docker run -d --name=result --link db:db -p 5001:80 dockersamples/examplevotingapp_result

#5 Create the workers container
docker run -d --name=worker --link db:db --link redis:redis dockersamples/worker


