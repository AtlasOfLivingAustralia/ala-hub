package au.org.ala.hub.hub


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(SecureSandboxInterceptor)
class SecureSandboxInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test secureSandboxFilters interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"secureSandboxFilters")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
