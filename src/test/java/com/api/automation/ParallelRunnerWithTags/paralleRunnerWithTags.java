package com.api.automation.ParallelRunnerWithTags;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;
//import com.intuit.karate.junit5.Karate;

public class paralleRunnerWithTags {
	
	private static final String Class_Path = "classpath:";

   @SuppressWarnings({ "rawtypes", "unchecked" })
@Test
    public void executeKarateTest(){
         Builder aRunner = new Builder();
         aRunner.path(getLocations());
         aRunner.tags(getTags());
         aRunner.parallel(5);
//        return Karate.run("classpath:com/api/automation").tags("@TC_03").relativeTo(getClass());

    }
   
   private List<String> getTags() {
	   String aTags = System.getProperty("tags", "");
	   System.out.println("aTags--------------------->"+aTags);
	   List<String> aTagList = Arrays.asList(aTags);
	   return aTagList;
   }
   
   private List<String> getLocations(){
	   String aLocation = System.getProperty("locations", "com/api/automation");
	   System.out.println("aLocation--------------------->"+aLocation);
	   List<String> aLocationList = Arrays.asList(Class_Path + aLocation);
	   return aLocationList;
   }
   
}
