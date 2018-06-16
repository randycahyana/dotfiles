## forward 80/443 -> 8443
sudo iptables -I INPUT 1 -p tcp --dport 8443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT

sudo iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-port 8443
sudo iptables -A PREROUTING -t nat -p tcp --dport 443 -j REDIRECT --to-port 8443

sudo iptables -I OUTPUT -t nat -p tcp -o lo --dport 80 -j REDIRECT --to-ports 8443
sudo iptables -I OUTPUT -t nat -p tcp -o lo --dport 443 -j REDIRECT --to-ports 8443

sudo sh -c "iptables-save > /etc/iptables/iptables.rules"
