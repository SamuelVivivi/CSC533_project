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
    ruby server.rb [option:safety/danger]
    example: ruby server.rb danger
```
Then run the client application:
```
    ruby client.rb [HMAC] [n]
    example: ruby client.rb ef2542fe60be0000000000000000000000000000 12 
    hint: If you want to get the correct result, the first n characters of HMAC should be correct
```

The character which is most likely to be correct at current HMAC position will be printed in the first place on the **client application** screen.

Explanation: 

we can brute crack the HMAC by changing the arguments from left to right. For example, at first, we use: 
```
    ruby client.rb 0000000000000000000000000000000000000000 0 
```
to crack the first bit, since we will know the first bit is 'e', then we will use:
```
    ruby client.rb e000000000000000000000000000000000000000 1 
```
to crack the second bit, the rest can be done in the same manner.



How to improve 
------------

 * It can be developed to crack the HMAC automactically.
 * ...

References 
------------
https://bugs.ruby-lang.org/issues/10098

https://github.com/ruby/openssl/pull/269

https://www.stackednotion.com/blog/2009/09/09/timing-attacks-in-ruby/

https://github.com/eggie5/hmac-timing-attacks

https://coolshell.cn/articles/19395.html

https://blog.csdn.net/qq_35246620/article/details/55806428


