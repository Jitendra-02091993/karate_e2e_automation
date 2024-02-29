package com.api.automation.ParallelRunnerWithTags;

import com.intuit.karate.junit5.Karate;

public class paralleRunnerWithTags {

    @Karate.Test
    public Karate executeKarateTest(){
        // Builder aRunner = new Builder();
        // aRunner.path("classpath:com/api/automation");
        // aRunner.parallel(5);
        // aRunner.tags("@TC_03");
        return Karate.run("classpath:com/api/automation").tags("@IDNOTEXIST,@TC_03").relativeTo(getClass());


    }
}
