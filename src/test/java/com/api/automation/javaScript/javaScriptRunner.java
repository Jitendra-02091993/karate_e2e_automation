package com.api.automation.javaScript;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class javaScriptRunner {

    @Test
    public Karate scriptRunner() {
        return Karate.run("javaScript").tags("@Script").relativeTo(getClass());
    }
}
