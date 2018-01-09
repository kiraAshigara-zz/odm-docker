# ODM Docker
this docker is for development, for debug the website configure jdpa in the 9001, for debug admin configure jdpa in the port 9000.

The website is running in the host machine in the address http://localhost.integrichain.com:8081/oil-web/.

The Admin is running in the host machine in the address http://localhost:8080/oms-admin after running the command bellow you will finish to setup your local environment

## Build Image
for build the image execute the next command when the script ask for the odm path provide a valid one
```bash
cd builder/ && sudo bash build-container.sh
```

## Run Container
after run the build image step, we can execute the next command
```bash
cd builder/ && bin/start-container.sh
```

## Kill Container
is important use the kill container for stop the container, this command stop the database before stop the container
```bash
cd builder/ && bin/kill-container.sh
```

## Deploy Web
this command is command is for deploy the web app, the code is compiled based in the path that you specified in the build command
```bash
cd builder/ && bin/deploy-web.sh
```


## Deploy Admin
this command is command is for deploy the admin app, the code is compiled based in the path that you specified in the build command
```bash
cd builder/ && bin/deploy-admin.sh
```

## JDPA Configuration
To Configure JDPA in neetbean go to debugger->attach and set the address to localhost,the port to 9000 for admin or 9001 for the website and the connector like SocketAttach just like the image bellow
![JDPA](/images/jdpa.png)
