Dockerized Transmission
=======================

Includes support for proxying via tsocks

Configure
=========

In tsocks.conf replace the following lines with your proxy configuration
```
server = <%= @proxy_host %>
server_port = <%= @proxy_port %>
default_user = <%= @proxy_username %>
default_pass = <%= @proxy_password %>
```

In settings.json replace the following lines with your proxy configuration
```
"proxy": "<%= @proxy_host %>", 
"proxy-auth-password": "<%= @proxy_password %>", 
"proxy-auth-username": "<%= @proxy_username %>", 
"proxy-port": <%= @proxy_port %>, 
```

To Build
========
```$ docker build -t transmission .```

