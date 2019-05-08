package grig.pitch.temperament;

class Pythagorean implements NoteCompatible
{
    private var baseNote:Note;
    private var basePitch:Float;
    private var ratios = new Array<Float>();

    private static var PYTHAGOREAN_RATIOS = [1.0, 1.0534979423868314, 1.125, 1.1851851851851851, 1.265625, 1.3333333333333333, 1.423828125,
                                            1.5, 1.5802469135802468, 1.6875, 1.7777777777777777, 1.8984375];

    public function pitchFromNote(note:Note):Float
    {
        var exp:Float = (note.octave - baseNote.octave);
        return ratios[note.key] * Math.pow(2.0, exp);
    }

    public function new(_baseNote:Note, _basePitch:Float)
    {
        baseNote = _baseNote;
        basePitch = _basePitch;

        for (i in 0...12) {
            var exp:Float = Math.floor((i - baseNote.key) / 12);
            var multiplier = Math.pow(2.0, exp);
            // Gotta have that sweet, sweet python modulo behavior
            var idx = (i - baseNote.key) % 12;
            while (idx < 0) idx += 12;
            ratios.push(PYTHAGOREAN_RATIOS[idx] * multiplier * basePitch);
        }
    }
}