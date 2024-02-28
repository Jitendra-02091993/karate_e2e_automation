package com.api.automation;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
public class paralleBuilder { 

    @Test
    public void executeKarateTest() {
        Builder runner = new Builder<>();
        runner.path("classpath:com/api/automation");
        Results result = runner.parallel(5);
        System.out.println("Total Features count==>" + result.getFeaturesTotal());
        System.out.println("Total Scenario count==>" + result.getScenariosTotal());
        System.out.println("Total Passed count==>" + result.getScenariosPassed());
        System.out.println("Total Failed count==>" + result.getFailCount());
        // generateCucumberReports(result.getReportDir());
        Assertions.assertEquals(0, result.getFailCount(), "There are some failed scenario");
    }

    // private void generateCucumberReports(String reportDirLocation) {
    //     File reportDir = new File(reportDirLocation);
    //     Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] { "txt" }, true);

    //     List<String> jsonFile = new ArrayList<String>();
    //     jsonCollection.forEach(file -> jsonFile.add(file.getAbsolutePath()));

    //     Configuration configuration = new Configuration(reportDir, "Karate Run");
    //     ReportBuilder reportBuilder = new ReportBuilder(jsonFile, configuration);
    //     reportBuilder.generateReports();
    // }

}
