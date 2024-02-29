package com.api.automation.deleteRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class deleteRunner {

    @Test
    public Karate deleteTestRunner() {
        return Karate.run("deleteData").tags("@TC_03").relativeTo(getClass());
    }

}
