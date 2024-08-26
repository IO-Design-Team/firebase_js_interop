#!/bin/zsh

# DEATH TO ALL
lsof -t -i tcp:4000 | xargs kill
lsof -t -i tcp:4400 | xargs kill
lsof -t -i tcp:4500 | xargs kill
lsof -t -i tcp:5000 | xargs kill
lsof -t -i tcp:5001 | xargs kill
lsof -t -i tcp:8080 | xargs kill
lsof -t -i tcp:8085 | xargs kill
lsof -t -i tcp:9000 | xargs kill
lsof -t -i tcp:9099 | xargs kill
lsof -t -i tcp:9199 | xargs kill
lsof -t -i tcp:9299 | xargs kill
lsof -t -i tcp:9399 | xargs kill

firebase emulators:start