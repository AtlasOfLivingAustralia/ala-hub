%{--<g:set var="facetResults" value="${groupedFacetsMap.get('basis_of_record').fieldResult as List}"/>--}%


<div class="facetsGroup" id="genomicFacets">
<g:each var="group" in="${genomicFacets}">
    <g:set var="keyCamelCase" value="${group.key.replaceAll(/\s+/,'')}"/>
   %{-- <div class="facetGroupName" id="heading_${keyCamelCase}">--}%

        <h4><g:message code="facet.group.${group.key}" default="${group.key}"/></h4>
        %{--<a href="#" class="showHideFacetGroup" data-name="${keyCamelCase}"><span class="caret right-caret"></span> <g:message code="facet.group.${group.key}" default="${group.key}"/></a>--}%

    %{--<div class="facetsGroup" id="group_${keyCamelCase}" style="display:none;">--}%

        <g:set var="firstGroup" value="${false}"/>
        <g:set var="facetFromGroup" value="${group.value}"/>


        <g:each in="${facetFromGroup.keySet()}" var="facetName">

                <g:set var="facetResult" value="${facetFromGroup.get(facetName)}"/>
                <g:set var="fieldDisplayName" value="${alatag.formatDynamicFacetName(fieldName:"${facetName}")}"/>
                <h4><span class="FieldName">${fieldDisplayName}</span></h4>
                <alatag:genomicFilter facetResult="${facetResult}" />
            <br/>
        </g:each>



</g:each>
</div>
<asset:script>
%{--<g:set var="facetResults" value="${groupedFacetsMap.get('basis_of_record').fieldResult as List}"/>--}%


$(document).ready(function() {
    <g:each in="${facetFromGroup.keySet()}" var="facetName">
        <g:set var="facetResult" value="${facetFromGroup.get(facetName)}"/>

<g:each var="result" in="${facetResult}">
%{--    var resultfq = '${result.fq?.encodeAsRaw()}';
    console.log('resultfq', resultfq);
    resultfq = decodeURIComponent('${result.fq}')
    console.log("decodeURIComponent", resultfq);--}%
    $("[name='${result.label}']").bootstrapSwitch({
        size: "tiny",
        onText: "No",
        onColor: "primary",
        offText: "Yes",
        offColor: "success",
        onSwitchChange: function(event, state) {
            console.log("switch toggled", state);
            console.log("value", "${result.fq}" );

     //       MAP_VAR.map.spin(true);
            if (!state) {
                removeFacetFilterFromParam('${result.fq.encodeAsRaw()}');
            } else {
                reloadWithParam('fq', '-${result.fq.encodeAsRaw()}' );
            //
            }
        },
        handleChange: function (event, state) {
            console.log(state);
            //this.setState({storyStatus: state});
        }
    });
    </g:each>


    </g:each>
    });
</asset:script>

%{--<alatag:facetLinkList facetResult="${facetResult}" queryParam="${queryParam}"/>--}%
%{--
<g:if test="${sr.activeFacetMap?.size() > 1 && sr.activeFacetMap.containsKey(facetResult.fieldName )}">

</g:if>
<g:set var="facetResults" value="${groupedFacetsMap.get('basis_of_record').fieldResult as List}"/>
<g:each var="result" in="${facetResults}">
<div class="activeFilters">
    ${result.label} <input type="checkbox" name="${result.label}" ${(result.count > 0 ? '' : 'checked')}/>
</div>
</g:each>--}%
