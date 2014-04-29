
class BootStrap {
    def grailsApplication

    def init = { servletContext ->
        log.info "config.security.cas.bypass = ${grailsApplication.config.security.cas.bypass}"
        log.info "config.ala.skin = ${grailsApplication.config.ala.skin}"
        log.info "config.biocache.ajax.useProxy = ${grailsApplication.config.biocache.ajax.useProxy}"
    }
    def destroy = {
    }
}
