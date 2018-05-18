package grig.pitch.temperament;

class EqualTemperament implements MidiCompatibleTemperament
{
    var baseNote:Note;
    var basePitch:Float;

    public function pitchFromMidiNote(midiNote:Int):Float
    {
        // TODO add caching or pre-compute, calculating roots every time is ridiculous
        // Calculating exp separately is needed to fix bug on php target for some reason
        var exp:Float = (midiNote - baseNote.midiNote) / 12.0;
        return basePitch * Math.pow(2.0, exp);
    }

    public function new(_baseNote:Note, _basePitch:Float)
    {
        baseNote = _baseNote;
        basePitch = _basePitch;
    }
}
