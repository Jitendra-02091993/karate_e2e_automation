package com.api.automation.secureRequest;

import com.intuit.karate.junit5.Karate.Test;
import com.intuit.karate.junit5.Karate;

public class secureGetRunner {

    @Test
    public Karate runSecureKarateTests() {
        return Karate.run("secureGetRequest").tags("@Secure_TC_01,@Secure_TC_02").relativeTo(getClass());
    }

}
