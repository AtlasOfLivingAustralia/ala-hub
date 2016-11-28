package au.org.ala.biocache.hubs.ala

class OccurrenceController {
    def geoIpService

    /**
     * Explore your area page - ALA version
     * Uses https://dev.maxmind.com/geoip/legacy/install/city/
     *
     * @return
     */
    def exploreYourArea() {
        def radius = params.radius?:5
        Map radiusToZoomLevelMap = grailsApplication.config.exploreYourArea.zoomLevels // zoom levels for the various radius sizes
        def lat = params.latitude?:grailsApplication.config.exploreYourArea.lat
        def lng = params.longitude?:grailsApplication.config.exploreYourArea.lng

        if (!(lat && lng)) {
            // try to determine lat/lng from IP address via lookup with MaxMind GeoLiteCity.dat
            // Download from http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz

            if (geoIpService) {
                def ipAddress = geoIpService.getIpAddress(request)
                def location = geoIpService.getLocation(ipAddress)
                log.debug "IP = ${ipAddress} || location = ${location}"

                if (location) {
                    lat = location.latitude
                    lng = location.longitude
                }
            }
        }

        [
                latitude: lat,
                longitude: lng,
                radius: radius,
                zoom: radiusToZoomLevelMap.get(radius),
                location: grailsApplication.config.exploreYourArea.location,
                speciesPageUrl: grailsApplication.config.bie.baseUrl + "/species/"
        ]
    }
}
