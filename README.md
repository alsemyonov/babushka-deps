babushka-deps
=============

Common babushka deps

## Installing from scratch:

```bash
# Preparing /opt directories for babushka
sudo mkdir /opt/{bin,babushka} && sudo chown -R $USER:$USER /opt/{bin,babushka}

# extending $PATH to include /opt/bin
export PATH="$PATH:/opt/bin"
echo 'export PATH="$PATH:/opt/bin"' >> ~/.profile

# Insta-install
# Remember to point babushka installation to /opt/babushka
sh -c "`curl https://babushka.me/up`"

# Installing development environment
babushka alsemyonov:development
```
