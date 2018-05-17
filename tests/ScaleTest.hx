package;

import grig.pitch.Key;
import grig.pitch.Mode;
import grig.pitch.Note;
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

}
