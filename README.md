# DockerMoodle

```docker build -t moodle .```

```docker run -d --name DB -p 3306:3306 -e MYSQL_DATABASE=moodle -e MYSQL_ROOT_PASSWORD=moodle -e MYSQL_USER=moodle -e MYSQL_PASSWORD=moodle mysql```

```docker run -i -t -d -P --name moodle --link DB:DB -e MOODLE_URL=http://52.56.223.58:8080 -p 8080:80 moodle```

## Commands to know

```sudo docker exec -i -t moodle /bin/bash```

```sudo docker logs moodle```
