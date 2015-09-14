modules = {
//    application {
//        resource url:'js/application.js'
//    }

    // Define your skin module here - it must 'dependsOn' either bootstrap (ALA version) or bootstrap2 (unmodified) and core

    ala {
        dependsOn 'bootstrap, hubCore, font-awesome'
        defaultBundle 'main-core'
        resource url: [ dir:'css', file: 'ala-styles.css', plugin:'ala-bootstrap3'], attrs:[media:'screen, projection, print'] // from ala-web-theme plugin
        resource url:[dir:'css', file:'ala-extra.css']
    }

}