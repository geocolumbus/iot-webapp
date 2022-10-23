#!/bin/bash
cd /opt/webapp/myproject || exit
rm -rf __*
pip3 install -r requirements.txt
systemctl restart gunicorn
