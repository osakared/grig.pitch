package grig.pitch.temperament;

class Just implements NoteCompatible
{
    private var baseNote:Pitch;
    private var basePitch:Float;
    private var ratios = new Array<Float>();

    private static var JUST_RATIOS = [1.0, 1.0666666666666667, 1.125, 1.2, 1.25, 1.3333333333333333, 1.40625, 1.5, 1.6, 1.6666666666666667, 1.8, 1.875];

    public function pitchFromNote(note:Pitch):Float
    {
        var exp:Float = (note.octave - baseNote.octave);
        return ratios[note.note] * Math.pow(2.0, exp);
    }

    public function new(_baseNote:Pitch, _basePitch:Float)
    {
        baseNote = _baseNote;
        basePitch = _basePitch;

        for (i in 0...12) {
            var exp:Float = Math.floor((i - baseNote.note) / 12);
            var multiplier = Math.pow(2.0, exp);
            // Gotta have that sweet, sweet python modulo behavior
            var idx = (i - baseNote.note) % 12;
            while (idx < 0) idx += 12;
            ratios.push(JUST_RATIOS[idx] * multiplier * basePitch);
        }
    }
}