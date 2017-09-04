package au.org.ala.hub

import groovy.json.JsonSlurper

class CollectoryService {

    def grailsApplication

    /**
     * Retrieves a listing of all uploads for this user.
     * @return JSON list of data resources
     */
    def getAllUploadsForUser(userId){
        try {
            def url = "${grailsApplication.config.collectoryUrl}/tempDataResource?alaId=${userId}"
            def js = new JsonSlurper()
            js.parseText(new URL(url).text)
        } catch (Exception e){
            log.error(e.getMessage(), e)
            null
        }
    }
}
