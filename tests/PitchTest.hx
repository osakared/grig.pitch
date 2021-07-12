package;

import grig.pitch.Pitch;
import grig.pitch.PitchClass;
import tink.unit.Assert.*;

@:asserts
class PitchTest
{

    public function new()
    {
    }

    public function testAdd()
    {
        var pitch = Pitch.fromMidiNote(59);
        pitch += 3;
        return assert(pitch.note == D);
    }

    public function testSubtract()
    {
        var pitch = Pitch.fromMidiNote(59);
        pitch -= 4;
        return assert(pitch.note == G);
    }

}