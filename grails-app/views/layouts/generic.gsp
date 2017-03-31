<g:applyLayout name="main">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <alatag:addApplicationMetaTags/>
    <meta name="description" content="${grailsApplication.config.skin.orgNameLong}"/>
    <meta name="author" content="${grailsApplication.config.skin.orgNameLong}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><g:layoutTitle /></title>
    <r:require modules="bootstrap, hubCore"/>
    <g:layoutHead />
    <hf:head/>
</head>
<body class="${pageProperty(name:'body.class')?:'nav-datasets'}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">
<ala:systemMessage/>
<g:set var="fluidLayout" value="${grailsApplication.config.skin.fluidLayout?.toBoolean()}"/>
<div class="${fluidLayout?'container-fluid':'container'}" id="main-content">
    <g:layoutBody />
</div><!--/.container-->

<div class="${fluidLayout?'container-fluid':'container'} hidden-desktop">
    <%-- Borrowed from http://marcusasplund.com/optout/ --%>
    <a class="btn btn-small toggleResponsive"><i class="icon-resize-full"></i> <span>Desktop</span> version</a>
    %{--<a class="btn btn-small toggleResponsive"><i class="icon-resize-full"></i> Desktop version</a>--}%
</div>

<!-- JS resources-->
%{--<r:layoutResources/>--}%

</body>
</g:applyLayout>