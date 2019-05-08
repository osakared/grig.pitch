package;

import grig.pitch.temperament.Arbitrary;
import grig.pitch.temperament.Equal;
import grig.pitch.temperament.Just;
import grig.pitch.temperament.Pythagorean;
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
        var temperament = new Equal(baseNote, basePitch);
        return assert(Math.abs(temperament.pitchFromNote(Note.fromMidiNote(76)) - 659.26) < 0.01);
    }

    public function testCents()
    {
        var temperament = new Equal(baseNote, basePitch);
        return assert(Math.abs(temperament.pitchFromCents(-100) - 415.30) < 0.01);
    }

    public function testArbitrary()
    {
        // Let's mimick Werckmeister with ratios
        var temperament = new Arbitrary(baseNote, basePitch, [1.0000, 1.0535, 1.1175, 1.1852, 1.2528, 1.3333, 1.4047, 1.4951, 1.5802, 1.6705, 1.7778, 1.8793]);
        return assert(Math.abs(temperament.pitchFromNote(Note.fromMidiNote(62)) - 294.34) < 0.01);
    }

    public function testPythagorean()
    {
        var temperament = new Pythagorean(baseNote, basePitch);
        return assert(temperament.pitchFromNote(Note.fromMidiNote(64)) == 330.0);
    }

    public function testJust()
    {
        var temperament = new Just(baseNote, basePitch);
        return assert(temperament.pitchFromNote(Note.fromMidiNote(73)) == 550.0);
    }

}
