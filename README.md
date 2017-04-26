# Selenium Grid Node - PhantomJS

Selenium Node configured to run PhantomJS 2.1.1. The main/core selenium version uses [1.9.8](https://github.com/SeleniumHQ/docker-selenium/blob/master/NodePhantomJS/Dockerfile#L15).

This is simply a modified version of [`selenium/node-phantomjs`](https://github.com/SeleniumHQ/docker-selenium/blob/master/NodePhantomJS/) that fixes the hub connection issues in the released 2.1.1 version.

The fix implemented can be seen [here](https://github.com/Prospress/phantomjs/commit/adce18e47df7058132cd4f9315512426a863bcb7). Discussion of the underlying issue and fix [here](https://github.com/detro/ghostdriver/pull/430).

The updated phantomjs bundle is downloaded from [here](https://github.com/Prospress/phantomjs/tree/2-1-1-hub-fix/downloads).

## How to use this image

First, you will need a Selenium Grid Hub that the Node will connect to.

```
$ docker run -d -P --name selenium-hub selenium/hub
```

Once the hub is up and running will want to launch nodes that can run tests. You can run as many nodes as you wish.

```
$ docker run -d --link selenium-hub:hub prospress/node-phantomjs
```

or with a version:

```
$ docker run -d --link selenium-hub:hub prospress/node-phantomjs:3.4.0-bismuth
```
