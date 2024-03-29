package page

import geb.Module

class AuthModule extends Module {
    static content = {
        username { $("#username") }
        password { $("#password") }
        submit { $("input[name=submit]") }
    }

    void login() {
        String user =""
        String passwd = ""

        Properties properties = new Properties()
        File propertiesFile = new File(System.getProperty("configFile"))
        if (propertiesFile.exists()) {
            propertiesFile.withInputStream {
                properties.load(it)
            }
        }

        user = System.getProperty("username")?: properties["username"]
        passwd = System.getProperty("password")?: properties["password"]

        if ( user && passwd) {
            username =  user
            password =  passwd
            submit.click()
        } else {
            assert false,  "Username and password is not supplied! \nUsername and password can be passed with -Dusername, -Dpassword. \nOr stored in the default property file"
        }
    }
}
