# ala-hub   [![Build Status](https://travis-ci.org/AtlasOfLivingAustralia/ala-hub.svg?branch=master)](https://travis-ci.org/AtlasOfLivingAustralia/ala-hub)
 

**ala-hub** is a Grails applications that provides the main view for the _Atlas of Living Australia_(ALA) [Occurrence search portal](http://biocache.ala.org.au/search) using [biocache-hub](https://github.com/AtlasOfLivingAustralia/biocache-hubs/) front-end.

## Versions
The grails2 branch contains the 2.4.x series of the app compatible with Grails 2.x

The master branch hosts version 3.x and forward of the app compatible with grails 3.x


## Geolite2 City Database
ALA Hub is the only Biocache Hub that uses the [MaxMind GeoIP 2 City Database](https://dev.maxmind.com/geoip/geoip2/geolite2/) to find the approximate user location based on IP Address.

The search, is performed on best effort and will be used only if the Google Maps API on the client is prevented from accessing the browser location. 

MaxMind performs updates to the database roughly every month, if you want to update the database in your deployment, you can perform the following commands on your ALA Hub ansible playbook. 


```
$ cd ala-install/ansible  
$ ansible-playbook -i inventories/vagrant/ala-hub-vagrant ala-hub-standalone.yml --private-key ~/.vagrant.d/insecure_private_key --user vagrant --sudo  --tags="geolite_db,setfacts" 
```

**Note:** Adjust environment specific settings accordingly.