#!/bin/bash


uwsgi --ini /var/LabManager/uwsgi.ini
tail -f /tmp/LabManager-master.pid