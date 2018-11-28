# SInherit
This is a cloud application for students.
The AIM is to build a second hand plantfrom for international student.
Students who registered can find all they need in a unfamiliar country from their upperclassman.

# Frontend
Our frontend AKA webpage used `React.js` framework to help us build up the webpage(up to now, maybe we will change our frontend some day).

# Backend
As our coursework requirements, we have to use Google App Engine service with Python as our backend, it means, at last, we will deploy our project into the cloud. We plan to use `Django@2.0.x` with `python@3.5.x`.

# Database
We plan to use `Google Bigtable` as our database.

# Tool
IDE: `PyCharm & WebStorm`.
Cloude plantform: `Google App Engine`.

# Web Structure
We plan to use `B/S patten` with `MVC` to build our cloud App. Divide the frontend design and backend design, each part members focus on their own part and
the Http request is the only same forms we have to handout.
 
# Issues
### 1.  When install the google-cloud-sdk, in MacOS X, there will have a error like this
```
Your current Cloud SDK version is: 225.0.0

ERROR: (gcloud.components.list) Failed to fetch component listing from server. 
Check your network settings and try again.
```

this bug may because of the google cloud sdk don't support ipv6, so some of the users switched off the
ipv6 function by disable the ipv6 :

```commandline
$ networksetup -setv6off Wi-Fi
```

then install it again by commend line :

```commandline
curl https://sdk.cloud.google.com | bash
```
or you can download this in their official web page [google cloud sdk download](https://cloud.google.com/sdk/?hl=zh_CN&_ga=2.68603153.-1042932690.1521454738&_gac=1.157629000.1542930078.Cj0KCQiAxNnfBRDwARIsAJlH29CBv56YRJ7jb8mtSE3V43UAnRJzJhPOgyjjnQ5Jx4JXLoy6E1dM4XoaAnBmEALw_wcB) 

__next, remember to switch on the ipv6 :__

```commandline
$ networksetup -setv6automatic Wi-Fi
``` 

*unfortunately, this way did not work in my Mac, so until nowm we cannot push forward our work even one step.*

__After a new version is released by google, this issue is fixed.__

```commandline
Your current Cloud SDK version is: 226.0.0
```

### 2.The Google App Engine only support Python2.7.x

I use Python3, but the Google App Engine seems only support Python2.7.X
```commandline
$  hello_world git:(master) dev_appserver.py app.yaml

ERROR: Python 3 and later is not compatible with the Google Cloud SDK. Please use Python version 2.7.x.

If you have a compatible Python interpreter installed, you can use it by setting
the CLOUDSDK_PYTHON environment variable to point to it.

```

I changed all the CLOUDSDK_PYTHON attributes in the google-cloud-sdk/install.sh file like the Error mentioned that.
However, this kind of change did not work!

Fixing...
