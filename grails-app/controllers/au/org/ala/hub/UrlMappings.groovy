package au.org.ala.hub

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'home')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
