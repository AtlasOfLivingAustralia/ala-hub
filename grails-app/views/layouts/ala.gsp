<g:applyLayout name="main">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <alatag:addApplicationMetaTags/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="breadcrumb" content="${pageProperty(name:'meta.breadcrumb')}">
    <meta name="breadcrumbs" content="${pageProperty(name:'meta.breadcrumbs')}">
    <meta name="breadcrumbParent" content="${pageProperty(name:'meta.breadcrumbParent')}">
    <meta name="hideBreadcrumb" content="${pageProperty(name:'meta.hideBreadcrumb')}">

    <title><g:layoutTitle /></title>
    <g:render template="/layouts/global" plugin="biocache-hubs"/>

    <asset:stylesheet src="alaBs.css" />
    <asset:javascript src="alaBs.js" />

    <g:layoutHead />

    <g:if test="${pageProperty(name:'meta.fluidLayout')}"><g:set var="fluidLayout" value="${pageProperty(name:'meta.fluidLayout').toBoolean()}"/></g:if>
    <g:else><g:set var="fluidLayout" value="${grailsApplication.config.skin.fluidLayout?.toBoolean()}"/></g:else>
</head>
<body class="${pageProperty(name:'body.class')?:'nav-datasets'} ${fluidLayout?'fluid':''}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">
<div class="${fluidLayout?'container-fluid':'container'}" id="main-content">
    <g:if test="${grailsApplication.config.getProperty('skin.dataQualityLink.show', Boolean, false) && request.getServletPath().contains("occurrences/search")}">
        <div style="text-align:center;"><a href="${grailsApplication.config.getProperty('skin.dataQualityLink.url', String, '')}${request.getServletPath()}?${request.getQueryString()}"
                class="btn btn-success tooltips" title="${grailsApplication.config.getProperty('skin.dataQualityLink.tooltip', String, '')}">${grailsApplication.config.getProperty('skin.dataQualityLink.text', String, 'Text not set')}</a>
        </div>
    </g:if>
    <g:layoutBody />
</div><!--/.container-->

<div class="${fluidLayout?'container-fluid':'container'} hidden-lg">
    <%-- Borrowed from http://marcusasplund.com/optout/ --%>
    <a class="btn toggleResponsive btn-default btn-sm"><i class="icon-resize-full"></i> <span>Desktop</span> version</a>
    %{--<a class="btn toggleResponsive btn-default btn-sm"><i class="icon-resize-full"></i> Desktop version</a>--}%
</div>

</body>
</g:applyLayout>
