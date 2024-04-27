FROM gustavovinicius/devsecops:ubuntu_server

# RUN apt-get update
# RUN apt-get install net-tools -y
# RUN apt-get install tcpdump -y
# RUN apt install systemctl -y
# RUN apt-get install isc-dhcp-server -y
# ADD ./Configurations/dhcpd.conf /etc/dhcp/dhcpd.conf
# RUN systemctl start isc-dhcp-server

ADD ./nginx/default.conf /etc/nginx/sites-available/default

ENTRYPOINT ["tail", "-f", "/dev/null"]