kon-itemdb
==========

KoN Item Database

I wrote the early version years ago in PHP and I don't feel like rewriting everything from scratch.  Sue me.



## Installation

These instructions are pretty much only for Ubuntu, if you use another linux distro you could probably still figure it out.

Pick a happy place for the repo to live and clone it in.

```
cd /home/andrew/src/git
```

```
git clone https://github.com/andyprime/kon-itemdb.git
```

Go to your web root and create a symbolic link to the new directory (I'm gonna assume you already have Apache2 installed)

```
ln -s /home/andrew/src/git/kon-itemdb/ /var/www/items-dev
```

Install Node.js and NPM (https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#ubuntu-mint-elementary-os)

```
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
```

Install grunt globally for easy use

```
sudo npm install -g grunt-cli
```

All other NPM requirements are in the repo, so just grunt to generate all the source files.

```
grunt
```

This doesn't cover sorting out the mysql login stuff. You're gonna have to hassle me about that directly for the momen.
