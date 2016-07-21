#!/bin/bash

docker stop chef-partner-cookbook-guide
docker rm -f $(docker ps -aq --filter name=cookbook-guide)
docker rm -f $(docker ps -aq --filter name=chef-partner-cookbook-guide)
docker pull jjasghar/chef-partner-cookbook-guide
docker run -p 1948:1948 --name 'cookbook-guide' -d 'jjasghar/chef-partner-cookbook-guide'
sleep 2
open http://localhost:1948/index.md
