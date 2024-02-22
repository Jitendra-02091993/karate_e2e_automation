package com.api.automation.javaScript;

import org.junit.jupiter.api.Test;

import com.intuit.karate.junit5.Karate;

public class javaScriptRunner {

    @Test
    public Karate scriptRunner() {
        return Karate.run("javaScript.feature").tags("@Script").relativeTo(getClass());
    }
}
