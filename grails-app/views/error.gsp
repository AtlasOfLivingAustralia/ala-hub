<!DOCTYPE html>
<html>
<head>
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="ala"/>
    <g:if env="development"><asset:stylesheet src="errors.css" type="text/css"/></g:if>
</head>
<body>
<h1>
    Application error
</h1>
<g:if env="development">
    <ul class="errors">
        <g:if test="${Throwable.isInstance(exception)}">
            <li><g:renderException exception="${exception}" /></li>
        </g:if>
        <g:elseif test="${flash.message}">
            <li>${alatag.stripApiKey(message: flash.message)}</li>
        </g:elseif>
        <g:else>
            <li>An error has occurred</li>
            <li>Exception: ${exception}</li>
            <li>Message: ${message}</li>
            <li>Path: ${path}</li>
        </g:else>
    </ul>
</g:if>
<g:else>
    <g:if test="${flash.message}">
        <ul class="errors">
            <li>${alatag.stripApiKey(message: flash.message)}</li>
        </ul>
    </g:if>
</g:else>
<ul class="errors">
    <li>If this problem persists, please send an email to <a href="mailto:${grailsApplication.config.supportEmail ?: 'support@ala.org.au'}?subject=Reporting error on page: ${request.serverName}${request.forwardURI}">${grailsApplication.config.supportEmail ?: 'support@ala.org.au'}</a> and include the URL to this page.</li>
</ul>

</body>
</html>
