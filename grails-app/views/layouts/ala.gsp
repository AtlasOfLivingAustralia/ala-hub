<g:applyLayout name="main">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <alatag:addApplicationMetaTags/>
        <meta name="description" content="Atlas of Living Australia"/>
        <meta name="author" content="Atlas of Living Australia">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://www.ala.org.au/wp-content/themes/ala2011/images/favicon.ico" rel="shortcut icon"  type="image/x-icon"/>

        <title><g:layoutTitle /></title>
        <g:render template="/layouts/global" plugin="biocache-hubs"/>

        <asset:stylesheet src="alaBs.css" />
        <asset:javascript src="alaBs.js" />

        <g:layoutHead />
    </head>
    <body class="${pageProperty(name:'body.class')?:'nav-datasets'}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">
    <g:if test="${pageProperty(name:'meta.fluidLayout')}"><g:set var="fluidLayout" value="${pageProperty(name:'meta.fluidLayout').toBoolean()}"/></g:if>
    <g:else><g:set var="fluidLayout" value="${grailsApplication.config.skin.fluidLayout?.toBoolean()}"/></g:else>
    <!-- Breadcrumb -->
    <g:if test="${pageProperty(name:'meta.breadcrumb')}">
        <section id="breadcrumb">
            <div class="container">
                <div class="row">
                    <ul class="breadcrumb-list">
                        <li><a href="https://www.ala.org.au/">Home</a></li>
                        <g:if test="${pageProperty(name:'meta.breadcrumbParent')}">
                            <g:set value="${pageProperty(name:'meta.breadcrumbParent').tokenize(',')}" var="parentArray"/>
                            <li><i class="icon icon-chevron-right"></i><a href="${parentArray[0]}">${parentArray[1]}</a></li>
                        </g:if>
                        <li class="active"><i class="icon icon-chevron-right"></i>${pageProperty(name:'meta.breadcrumb')}</li>
                    </ul>
                </div>
            </div>
        </section>
    </g:if>
    <!-- End Breadcrumb -->

    <div class="${fluidLayout?'container-fluid':'container'} hidden-desktop">
        <%-- Borrowed from http://marcusasplund.com/optout/ --%>
        <a class="btn btn-small toggleResponsive"><i class="icon-resize-full"></i> <span>Desktop</span> version</a>
        %{--<a class="btn btn-small toggleResponsive"><i class="icon-resize-full"></i> Desktop version</a>--}%
    </div>

    </body>
</g:applyLayout>