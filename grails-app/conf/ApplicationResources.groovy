modules = {
//    application {
//        resource url:'js/application.js'
//    }

    // Define your skin module here - it must 'dependsOn' either bootstrap (ALA version) or bootstrap2 (unmodified) and core

    alaBs {
        dependsOn 'ala', 'hubCore' // from ala-web-theme plugin
        defaultBundle 'main-core'
        resource url:[dir:'css', file:'ala-extra.css'],attrs: [ media: 'all' ]
    }

}