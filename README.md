# ala-hub   [![Build Status](https://travis-ci.com/AtlasOfLivingAustralia/ala-hub.svg?branch=develop)](https://travis-ci.com/github/AtlasOfLivingAustralia/ala-hub)
 

**ala-hub** is a Grails applications that provides the main view for the _Atlas of Living Australia_(ALA) [Occurrence search interface](http://biocache.ala.org.au/search) using [biocache-hub](https://github.com/AtlasOfLivingAustralia/biocache-hubs/)  (Grails plugin) front-end.

## Versions
The 8.x version, Grails 6.2.3 and Java 17

The grails4 branch, 5.x version, contains the 4.0.12 series of the app compatible with Grails 4.0.x

The grails2 branch contains the 2.4.x series of the app compatible with Grails 2.x

The master branch hosts version 3.x and forward of the app compatible with grails 3.x

##External config##
Change values in external configuration files

#### Customised facets
```
biocache.groupedFacetsUrl = "file:///data/ala-hub/config/grouped_facets_ala.json" 
```
#### callback server url from Biocache service
```
serverName=http://localhost:8081  
```

## Geolite2 City Database
ALA Hub is the only Biocache Hub that uses the [MaxMind GeoIP 2 City Database](https://dev.maxmind.com/geoip/geoip2/geolite2/) to find the approximate user location based on IP Address, as a fallback to using the browser's JavaScript location lookup.

The search, is performed on best effort and will be used only if the Google Maps API on the client is prevented from accessing the browser location. 

MaxMind performs updates to the database roughly every month, if you want to update the database in your deployment, you can perform the following commands on your ALA Hub ansible playbook. 

```
$ cd ala-install/ansible  
$ ansible-playbook -i inventories/vagrant/ala-hub-vagrant ala-hub-standalone.yml --private-key ~/.vagrant.d/insecure_private_key --user vagrant --sudo  --tags="geolite_db,setfacts" 

```

## Functional test

The build is setup to work with Firefox and Chrome.

Have a look at the `build.gradle` and the `src/test/resources/GebConfig.groovy` file.

From line 200 in build.gradle, you will find how we pass different test servers and authentication into tests.


### Usage

### Run with Firefox (default):

    ./gradlew :integrationTest -Dusername=xxxx -Dpassword=xxxxx

Or

    ./gradlew :integrationTest

when authentication is stored into the default file:

    /data/spatial-hub/test/default.properties


**See more: [How to pass authentication](#Authentication)**

### run with Chrome:

    ./gradlew :integrationTest -Ddriver=chrome

Chrome driver > 89 is not available for webdirver
Use npm to set the chrome driver version and reference the lib path from node_modules.

Add `"chromedriver": "89.0.0"` to package.json

Run `npm install`

    In ./gebConfig.groovy

    if (!System.getProperty("webdriver.chrome.driver")) {
        System.setProperty("webdriver.chrome.driver", "node_modules/chromedriver/bin/chromedriver")
    } 

### Test other servers:

    ./gradlew :integrationTest -DbaseUrl=http://spatial-test.ala.org.au/


### Authentication

Authentication info can be passed through with -Dusername and -Dpassword

    /gradlew :integrationTest -Dusername=xxxx -Dpassword=xxxxx

Or stored in a config file. The default config file is located in

    /data/spatial-hub/test/default.properties
    
    username="xxxx@csiro.au"
    password="xxxxx"

We can change the config file with -DconfigFile

    /gradlew :integrationTest -DconfigFile="myconfig.properties"


**Note:** Adjust environment specific settings accordingly.

