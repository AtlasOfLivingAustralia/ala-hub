<div class="panel genomic-panel">
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
</div>

<asset:script>

     $(document).ready(function() {

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
                        removeFacetFilterFromParam(this.name);
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
