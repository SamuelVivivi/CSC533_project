Simple Timing attack Demo
=========

This demo could simulate a simple timing attack on HMAC authenticating. It contains a server app and a client app.

Setup
-----

* Environment

    I've tested the demo with Ruby 2.7.4 on Ubuntu 20.04, note that Ruby version >=3.0 is not supported.

* Install Gem files

```
    cd [your code path]/webapp/
    bundle install

    cd [your code path]/clientapp/
    bundle install
```

Usage
-----

Run the server application first:
```
    ruby server.rb
```
Then run the client application:
```
    ruby client.rb
```
The character which is most likely to be correct at current HMAC position will be printed in the first place on the **client application** screen.

How to improve 
------------

 * It can be developed to crack the HMAC automactically.
 * ...

References 
------------

https://www.stackednotion.com/blog/2009/09/09/timing-attacks-in-ruby/