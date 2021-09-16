package au.org.ala.hub

import au.org.ala.hub.SecureSandboxInterceptor
import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification


class SecureSandboxInterceptorSpec extends Specification implements InterceptorUnitTest<SecureSandboxInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test secureSandbox interceptor matching proxy"() {
        when:"A request matches the interceptor"
            withRequest(controller:"proxy")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }

    void "Test secureSandbox interceptor matching occurrence"() {
        when:"A request matches the interceptor"
        withRequest(controller:"occurrence")

        then:"The interceptor does match"
        interceptor.doesMatch()
    }
}
