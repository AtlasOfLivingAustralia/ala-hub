import geb.spock.GebSpec
import page.HomePage

/**
 *   ./gradlew :integrationTest -Ddriver=chrome
 *   ./gradlew :integrationTest -DbaseUrl=xxxx -Dusername=xxxx -Dpassword=xxxx
 */
class HomepageSpec extends GebSpec {
    int pause = 3000

    def "Search taxa"() {
        when:
        via HomePage

        then:
        waitFor 30, { simpleSearchTab.displayed }

        when:
        clickSearchTab("Simple search")

        then:
        waitFor 10, {taxaInput.displayed}

        when:
        taxaInput.value("Acacia")

        then:
        waitFor 10, {autocompleteList[0].displayed}

        when:
        selectFromAutocomplete(2)
        locationSearchSubmitBtn.click()

        then:
        waitFor 20, { resultTitle.startsWith("Occurrence records")}
        resultList.size() > 2
        Thread.sleep(pause)
    }
}