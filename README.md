# Integration
Docker container for demo/install

## Doc-Regex-Web
Docker container which installs the current version of document mangement, regexp service and the web frontend (from github).
Build with ``docker build . --build-args user=githubusername:password -t anonml/drw``

## Complete
* Change DockerFS to `aufs`
* cd into the `complete` directory
* run `docker build . --build-arg user=<githubusername>:<githubpassword> -t <some name>`
* `docker run -p 9000:9000 -p 9001:9001 -p 9002:9002 -p 9003:9003 -p 9901:9901 -p 9902:9902 -p 9903:9903
* open `http://localhost:9000` to access the UI
* use `http://localhost:{9901; 9902; 9903}/logfile` to see the logfiles


## Misc
If you get an 'out of disc space' error, delete ` ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2` (will delete all docker container)
