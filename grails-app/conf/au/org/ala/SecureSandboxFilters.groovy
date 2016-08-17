package au.org.ala

class SecureSandboxFilters {

    def authService
    def grailsApplication

    def filters = {
        all(controllers:['proxy', 'occurrence'], action:'*') {
            before = {
                log.info("Secure sandbox filters")
                // restrict all proxy and occurrence requests to a user's uploads.
                if (grailsApplication.config.sandbox.access.restricted.toString().toBoolean()) {
                    def isAdmin = request.isUserInRole(grailsApplication.config.auth.admin_role)
                    if (isAdmin) {
                        return;
                    }

                    def userId = authService.getUserId()

                    if (userId) {
                        params.qc = "(NOT data_resource_uid:drt*) OR user_id:$userId"
                    } else {
                        params.qc = '(NOT data_resource_uid:drt*) OR false' // Need to include OR to prevent biocache from mangling the query
                    }

                    log.info("Params QC: ${params.qc}")

                    //required by ProxyController to include qc with the queryString
                    request.parameterMap.put('qc', [params.qc])
                }
            }
        }
    }
}
