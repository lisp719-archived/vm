#!/bin/sh

vagrant up
vagrant reload
vagrant ssh-config > config
