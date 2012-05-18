# Typical Desktop Setup

## Plex Media Server
- [installation instructions](http://forums.plexapp.com/index.php/topic/26727-how-to-plex-media-server-on-ubuntu/)
- `sudo ufw allow 32400`

## Samba

`sudo apt-get install samba`

### Sample Config

    [global]
        security    = user
        guest ok    = no

        # allow specific client only
        hosts allow = 192.168.1.x

    [data]
        comment     =  Data disk 
        path        =  /srv/samba/share/xxx
        browsable   =  yes
        read only   =  no

        # permissions of newly created files
        create mask =  0755

### Set Samba User Password

`sudo smbpasswd -a username` (username can be existing user)

### Open Firewall ports

following [this post](http://ubuntuforums.org/showthread.php?t=806000)
 
`sudo allow Samba` (this did not work), but manually opening relevant ports worked:

    sudo ufw allow proto udp from 192.168.1.0/24 to any port 137
    sudo ufw allow proto udp from 192.168.1.0/24 to any port 138
    sudo ufw allow proto tcp from 192.168.1.0/24 to any port 139
    sudo ufw allow proto tcp from 192.168.1.0/24 to any port 445

(`0/24`) was not accepted, but just giving it a number like `4` was

## Grub

## Change boot config

`sudo vim /etc/default/grub`
`sudo update-grub`
