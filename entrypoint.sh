#!/bin/bash

set -e

USERNAME=$1
PASSWORD=$2

if [ -z $USERNAME ]; then
  echo 'Required user parameter'
  exit 1
fi

if [ -z $PASSWORD ]; then
  echo 'Required password parameter'
  exit 1
fi

cpan-upload --user $USERNAME --password $PASSWORD --dry-run *.tar.gz
