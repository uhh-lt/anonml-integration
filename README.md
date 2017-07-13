# Integration
Docker container for demo/install

## Doc-Regex-Web
Docker container which installs the current version of document mangement, regexp service and the web frontend (from github).
Build with ``docker build . --build-args user=githubusername:password -t anonml/drw``

## Complete
Change DockerFS to `aufs`

## Misc
If you get an 'out of disc space' error, delete ` ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2` (will delete all docker container)
