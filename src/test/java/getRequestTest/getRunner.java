package getRequestTest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class getRunner {

    @Test
    public Karate runTest() {
        return Karate.run("validateJSONResponseFromFile").tags("@FileJSON").relativeTo(getClass());
    }
}
