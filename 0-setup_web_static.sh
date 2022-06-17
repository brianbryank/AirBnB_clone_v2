#!/usr/bin/env bash
# Bash script that sets up the deployment of web_static for web servers
sudo apt-get update
sudo apt-get install -y nginx
sudo mkdir /data/
sudo mkdir /data/web_static/
sudo mkdir /data/web_static/releases/
sudo mkdir /data/web_static/shared/
sudo mkdir /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
echo "<html><head></head><body>Holberton School</body></html>" | sudo tee /data/web_static/releases/test/index.html
sudo chown -R ubuntu:ubuntu /data
sudo sed -i '37i\\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}' /etc/nginx/sites-enabled/default
sudo service nginx restart
