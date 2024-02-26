package com.api.automation.postRequest.dataDriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class dataDrivenRunner {
    @Test
    public Karate putRequestRunner() {
        return Karate.run("dataDriven").tags("@TC_ScenarioOutline_ExternalFiles").relativeTo(getClass());
    }
}
