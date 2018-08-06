<!doctype html>
<html>
    <head>
        <title>Page Not Found</title>
        <meta name="layout" content="main">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <ul class="errors">
            <li>Error: Page Not Found (404)</li>
            <li>Path: ${request.forwardURI}</li>
        </ul>
    <!-- Test test.heading g:message - <g:message code="test.heading" default="not set"/><br>
    Test test.heading alatag:message - <alatag:message code="test.heading" default="not set"/><br>
    Test test.app.only g:message - <g:message code="test.app.only" default="not set"/><br>
    Test test.app.only alatag:message - <alatag:message code="test.app.only" default="not set"/><br>
    Test test.plugin.only g:message - <g:message code="test.plugin.only" default="not set"/><br>
    Test test.plugin.only alatag:message - <alatag:message code="test.plugin.only" default="not set"/><br>
    Test class.eventDate (biocache-service) g:message - <g:message code="class.eventDate" default="not set"/><br>
    Test class.eventDate (biocache-service) alatag:message - <alatag:message code="class.eventDate" default="not set"/><br> -->
    </body>
</html>
