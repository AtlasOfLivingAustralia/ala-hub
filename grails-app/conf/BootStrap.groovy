import grails.util.Holders

class BootStrap {

    def init = { servletContext ->
        log.debug "config.security.cas.bypass = ${Holders.config.security.cas.bypass}"
        log.debug "config.ala.skin = ${Holders.config.ala.skin}"
    }
    def destroy = {
    }
}
