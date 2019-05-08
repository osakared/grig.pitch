package grig.pitch.temperament;

class Equal implements NoteCompatible
{
    private var baseNote:Note;
    private var basePitch:Float;

    public function pitchFromNote(note:Note):Float
    {
        // TODO add caching or pre-compute, calculating roots every time is ridiculous
        // Calculating exp separately is needed to fix bug on php target for some reason
        var exp:Float = (note.midiNote - baseNote.midiNote) / 12.0;
        return basePitch * Math.pow(2.0, exp);
    }

    // Cents away from base note
    public function pitchFromCents(cents:Float):Float
    {
        // Calculating exp separately to get around bug seen in php
        var exp:Float = (cents / 1200.0);
        return basePitch * Math.pow(2.0, exp);
    }

    public function new(_baseNote:Note, _basePitch:Float)
    {
        baseNote = _baseNote;
        basePitch = _basePitch;
    }
}
