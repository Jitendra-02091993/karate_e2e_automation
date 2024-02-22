package com.api.automation.schemaValidation;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class schemaValidationRunner {

    @Test
    public Karate schemaRunner() {

        return Karate.run("schemaValidation").tags("@TC_02_Schema").relativeTo(getClass());
    }

}
