package;

import grig.pitch.Key;
import grig.pitch.Scale;
import tink.unit.Assert.*;

@:asserts
class ScaleTest {

    public function new()
    {
    }

    public function testCMajor()
    {
        var scale = new Scale(C, Ionian);
        return assert(scale.notes[2] == E);
    }

    public function testCMinor()
    {
        var scale = new Scale(C, Aeolian);
        return assert(scale.notes[2] == Eb);
    }

    public function testPhrygian()
    {
        var scale = new Scale(C, Phrygian);
        return assert(scale.notes[1] == Db);
    }

    public function testDegree()
    {
        var scale = new Scale(C, Ionian);
        return assert(scale.get(2) == scale.get(14) && scale.get(14) == scale.get(-10) && scale.get(-10) == E);
    }

    public function testConvenience()
    {
        var major = new Scale(A, Ionian);
        var minor = new Scale(A, Aeolian);
        return assert(major.third == Db && minor.third == C);
    }

}
