package music.pitch;

class EqualTemperament implements Temperament
{
    var baseNote:Note;
    var basePitch:Float;

    // private static inline var ratio:Float = 1.0594630943592953; // Math.pow(2.0, (1.0 / 12.0));

    public function pitchFromMidiNote(midiNote:Int):Float
    {
        return basePitch * Math.pow(2.0, (midiNote - baseNote.midiNote) / 12.0);
        return 40.0;
    }

    public function new(_baseNote:Note, _basePitch:Float)
    {
        baseNote = _baseNote;
        basePitch = _basePitch;
    }
}