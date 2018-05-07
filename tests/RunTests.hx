package;
  
import tink.testrunner.*;
import tink.unit.*;

class RunTests {

    static function main()
    {
        Runner.run(TestBatch.make([
            new ScaleTest(),
            new TemperamentTest(),
        ])).handle(Runner.exit);
    }

}
