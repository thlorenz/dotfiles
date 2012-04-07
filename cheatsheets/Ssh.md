# Config SSH

Follow steps given [here](http://articles.slicehost.com/2010/10/18/ubuntu-maverick-setup-part-1)

## Local Station

    mkdir ~/.ssh
    ssh-keygen -t rsa

    scp ~/.ssh/id_rsa.pub user@target:

## Remote Machine
    
    sudo mkdir ~user/.ssh
    sudo mv ~user/id_rsa.pub ~user/.ssh/authorized_keys

    sudo chown -R user:user ~user/.ssh
    sudo chmod 700 ~user/.ssh
    sudo chmod 600 ~user/.ssh/authorized_keys

### SSH config
    
Change port in config:

    sudo vim /etc/ssh/sshd_config 

### Reload ssh
    `sevice reload ssh` or `/etc/init.d/ssh reload` 

### Local Station

    ssh -p port user@url
