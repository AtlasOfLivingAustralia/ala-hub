package au.org.ala.hub

import groovy.util.logging.Slf4j


@Slf4j
class SecureSandboxInterceptor {
    SecureSandboxInterceptor() {
        match(controller:"proxy")
        match(controller:"occurrence")
    }

    boolean before() {
        log.debug("SecureSandboxInterceptor invoked.")
        // restrict all proxy and occurrence requests to a user's uploads.
        if (grailsApplication.config.sandbox.access.restricted?.toString()?.toBoolean()) {
            def isAdmin = request.isUserInRole(grailsApplication.config.auth.admin_role)
            if (isAdmin) {
                return true
            }

            def userId = authService.getUserId()

            if (userId) {
                params.qc = "(NOT data_resource_uid:drt*) OR user_id:$userId"
            } else {
                params.qc = '(NOT data_resource_uid:drt*) OR false' // Need to include OR to prevent biocache from mangling the query
            }

            log.debug("Params QC: ${params.qc}")

            //required by ProxyController to include qc with the queryString
            request.parameterMap.put('qc', params.qc)
        }
        return true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
