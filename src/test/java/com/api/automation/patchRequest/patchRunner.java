package com.api.automation.patchRequest;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class patchRunner {

    @Test
    public Karate patchRunnerKarateTest(){
       return Karate.run("updatePartialData").tags("@IDNOTEXIST,@POSITIVEFLOW").relativeTo(getClass());
    }

}
