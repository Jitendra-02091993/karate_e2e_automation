package com.api.automation.putRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class putRequestRunner {

    @Test
    public Karate putRequestRunner() {
        return Karate.run("putRequest").tags("@PUTReadVariables").relativeTo(getClass());
    }
}
