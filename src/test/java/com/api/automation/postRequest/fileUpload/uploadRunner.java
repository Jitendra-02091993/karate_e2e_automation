package com.api.automation.postRequest.fileUpload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class uploadRunner {

    @Test
    public Karate putRequestRunner() {
        return Karate.run("fileUpload").tags("@TC_01").relativeTo(getClass());
    }

}