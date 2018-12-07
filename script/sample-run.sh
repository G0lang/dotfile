#!/bin/bash

. $(dirname ${BASH_SOURCE})/run.sh

run "docker ps -a "
run "docker volume ls "

