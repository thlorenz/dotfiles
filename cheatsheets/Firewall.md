# Uncomplicated Firewall

- simple commands to manage firewall settings in Ubuntu like `sudo ufw enable` and `sudo ufw allow 5900`
- documentation [here](https://help.ubuntu.com/10.04/serverguide/C/firewall.html)

# iptables

## Show Rules

    sudo iptables -L

## Config 

Download template and adjust port to match ssh port
    
    sudo wget http://articles.slicehost.com/assets/2007/9/4/iptables.txt

    sudo mv iptables.txt /etc/iptables.up.rules

Tell system to load iptables on startup

    sudo vim /etc/network/if-pre-up.d/iptables

Enter:
    
    #!/bin/sh
    /sbin/iptables-restore < /etc/iptables.up.rules

Make script executable

    sudo chmod +x /etc/network/if-pre-up.d/iptables

### Edit iptables later

    sudo vim /etc/iptables.up.rules
    sudo iptables -F
    sudo iptables-restore < /etc/iptables.up.rules
