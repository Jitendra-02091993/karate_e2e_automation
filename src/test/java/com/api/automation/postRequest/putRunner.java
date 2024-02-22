package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class putRunner {

    @Test
    public Karate putRequestRunner() {
        return Karate.run("createJob").tags("@embedded").relativeTo(getClass());
    }

}