package grig.pitch.temperament;

class Arbitrary implements NoteCompatible
{
    private var baseNote:Note;
    private var basePitch:Float;
    private var pitchRatios:Array<Float>;

    public function pitchFromNote(note:Note):Float
    {
        var exp:Float = (note.octave - baseNote.octave);
        return basePitch * pitchRatios[note.key] * Math.pow(2.0, exp);
    }

    public function new(_baseNote:Note, _basePitch:Float, _pitchRatios:Array<Float>)
    {
        if (_pitchRatios.length != 12) throw('Unacceptable number of ratios: ${_pitchRatios.length}'); // Should this be a compile-time check instead and not use arrays?
        pitchRatios = _pitchRatios;
        baseNote = Note.fromKey(Key.C, _baseNote.octave);
        basePitch = _basePitch / pitchRatios[_baseNote.key];
    }
}