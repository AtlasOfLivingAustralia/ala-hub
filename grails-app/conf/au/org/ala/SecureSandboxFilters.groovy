package au.org.ala

class SecureSandboxFilters {

    def authService
    def collectoryService
    def grailsApplication

    def filters = {
        all(controllers:['proxy', 'occurrence'], action:'*') {
            before = {
                // restrict all proxy and occurrence requests to a user's uploads.
                if (grailsApplication.config.sandbox.access.restricted.toString().toBoolean()) {
                    def isAdmin = request.isUserInRole(grailsApplication.config.auth.admin_role)
                    if (isAdmin) {
                        return;
                    }

                    def userId = authService.getUserId()
                    def drts = collectoryService.getAllUploadsForUser(userId)

                    if (drts && drts.size() > 0) {
                        //restrict to user's data resources
                        params.qc = ''
                        drts.each {
                            if (params.qc.length() > 0) params.qc += ' OR '
                            params.qc += 'data_resource_uid:' + it.uid
                        }
                    } else {
                        //prevent access
                        params.qc = '-*:*'
                    }

                    //required by ProxyController to include qc with the queryString
                    request.parameterMap.put('qc', [params.qc])
                }
            }
        }
    }
}
