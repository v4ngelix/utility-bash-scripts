#!/bin/bash

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/zone_rsa
ssh virt65914@boheemia.ee
