# Integration
Docker container for demo/install

## Doc-Regex-Web
Docker container which installs the current version of document mangement, regexp service and the web frontend (from github).
Build with ``docker build . --build-arg user=githubusername:password -t anonml/drw``

## Complete
* Change DockerFS to `aufs`
* cd into the `complete` directory
* run `docker build . --build-arg --build-arg branch=release -t anonml/all --no-cache`
* `docker run <some name> -p 9000:9000 -p 7000:7000`
* open `http://localhost:9000` to access the UI
* use `http://localhost:7000` to see the admin ui


## Misc
If you get an 'out of disc space' error, delete ` ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2` (will delete all docker container)
