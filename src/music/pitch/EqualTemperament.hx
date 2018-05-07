package music.pitch;

class EqualTemperament implements Temperament
{
    var baseNote:Note;
    var basePitch:Float;

    public function pitchFromMidiNote(midiNote:Int):Float
    {
        return basePitch * Math.pow(2.0, (midiNote - baseNote.midiNote) / 12.0);
    }

    public function new(_baseNote:Note, _basePitch:Float)
    {
        baseNote = _baseNote;
        basePitch = _basePitch;
    }
}
