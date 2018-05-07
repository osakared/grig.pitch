package;

import music.pitch.EqualTemperament;
import music.pitch.Note;
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
        return assert(Math.abs(temperament.pitchFromMidiNote(76) - 659.26) < 0.01);
    }

}