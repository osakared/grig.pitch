package;

import grig.pitch.PitchClass;
import grig.pitch.Key;
import tink.unit.Assert.*;

@:asserts
class KeyTest
{

    public function new()
    {
    }

    public function testCMajor()
    {
        var key = new Key(C, Ionian);
        return assert(key.notes[2] == E);
    }

    public function testCMinor()
    {
        var key = new Key(C, Aeolian);
        return assert(key.notes[2] == Eb);
    }

    public function testPhrygian()
    {
        var key = new Key(C, Phrygian);
        return assert(key.notes[1] == Db);
    }

    public function testDegree()
    {
        var key = new Key(C, Ionian);
        return assert(key.get(2) == key.get(14) && key.get(14) == key.get(-10) && key.get(-10) == E);
    }

    public function testConvenience()
    {
        var major = new Key(A, Ionian);
        var minor = new Key(A, Aeolian);
        return assert(major.third == Db && minor.third == C);
    }

}
