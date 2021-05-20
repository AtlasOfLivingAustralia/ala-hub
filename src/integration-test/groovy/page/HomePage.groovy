package page

import geb.Page

class HomePage extends Page {
    static at = { title == "ALA | Login" || title.startsWith("Search for records | Atlas of Living Australia") }

    static content = {
        authModule { module(AuthModule) }
        simpleSearchTab { $('a#t1') }

        taxaInput { $("input#taxa") }
        locationSearchSubmitBtn { $("input#locationSearch.btn") }
        autocompleteList { $("ul.ui-autocomplete li") }


        //Search result
        resultTitle { $("div#listHeader").find('h1').text() }
        resultList { $("div#results").find(".recordRow") }

    }

    void clickSearchTab(name) {
        $("ul#searchTabs").find("a",text: name).click()
    }

    void selectFromAutocomplete(n) {
        autocompleteList[n].click()
    }




}

