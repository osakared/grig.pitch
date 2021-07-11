package;
  
import tink.testrunner.*;
import tink.unit.*;

class RunTests
{

    static function main()
    {
        Runner.run(TestBatch.make([
            new KeyTest(),
            new NoteTest(),
            new ScaleTest(),
            new TemperamentTest(),
        ])).handle(Runner.exit);
    }

}
