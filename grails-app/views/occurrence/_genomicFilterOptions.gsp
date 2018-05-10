<div class="panel genomic-panel">
    ${alatag.logMsg(msg:"Before grouped genomicFacets")}
    <form id="genomicForm">
        <g:each var="group" in="${genomicFacets}">
            <g:set var="keyCamelCase" value="${group.key.replaceAll(/\s+/,'')}"/>
            <div class="facetsGroupName" id="genomicFacets_${keyCamelCase}">
               %{-- <h4><g:message code="facet.group.${group.key}" default="${group.key}"/></h4>--}%
               <g:set var="facetFromGroup" value="${group.value}"/>
               <g:each in="${facetFromGroup.keySet()}" var="facetName">

                    <g:set var="facetResult" value="${facetFromGroup.get(facetName)}"/>
                    <g:set var="fieldDisplayName" value="${alatag.formatDynamicFacetName(fieldName:"${facetName}")}"/>
                    <div class="facetsGroup genomicFacetsGroup" id="genomicFacets_${facetName}">
                        <h4><span class="FieldName">${fieldDisplayName}</span></h4>
                        <br>
                        <alatag:genomicFilter facetResult="${facetResult}" />
                    </div>
                </g:each>
            </div>
        </g:each>
    </form>
</div>

<asset:script>

    $(document).ready(function() {

            // Reset the checkbox to the state of the form that is sent from the server.
            // https://github.com/Bttstrp/bootstrap-switch/issues/453
            document.getElementById("genomicForm").reset();

            $("[class='genomicFacetInput']").bootstrapSwitch({
                size: "mini",
                onText: "No",
                onColor: "primary",
                offText: "Yes",
                offColor: "success",
                animate: false,
                onSwitchChange: function(event, data) {
                    console.log (this);
                    console.log (data);
                    if (!data) {
                        if (this.value == 'Unknown') {
                            removeFacetFilterFromParam(this.name);
                        } else {
                            removeFacetFilterFromParam("-" + this.name);
                        }
                    } else {
                        if (this.value == 'Unknown') {
                            reloadWithParam('fq', this.name );
                        } else {
                          reloadWithParam('fq', '-' + this.name );
                        }
                    }
                }

            });
    });

</asset:script>
