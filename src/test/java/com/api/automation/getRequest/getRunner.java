package com.api.automation.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class getRunner {

    @Test
    public Karate runTest() {
        return Karate.run("jsonPathExpression").tags("@TC_01_PathExpression").relativeTo(getClass());
    }
}
