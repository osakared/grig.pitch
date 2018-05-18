package;

import grig.pitch.temperament.EqualTemperament;
import grig.pitch.Note;
import tink.unit.Assert.*;

@:asserts
class TemperamentTest {

    private var baseNote:Note;
    private var basePitch:Float;

    public function new()
    {
        baseNote = Note.fromMidiNote(69);
        basePitch = 440.0;
    }

    public function testEqualTemperament()
    {
        var temperament = new EqualTemperament(baseNote, basePitch);
        trace(temperament.pitchFromMidiNote(76));
        return assert(Math.abs(temperament.pitchFromMidiNote(76) - 659.26) < 0.01);
    }

}
