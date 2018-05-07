package music.pitch.temperament;

class EqualTemperament implements MidiCompatibleTemperament
{
    var baseNote:Note;
    var basePitch:Float;

    public function pitchFromMidiNote(midiNote:Int):Float
    {
        // TODO add caching or pre-compute, calculating roots every time is ridiculous
        return basePitch * Math.pow(2.0, (midiNote - baseNote.midiNote) / 12.0);
    }

    public function new(_baseNote:Note, _basePitch:Float)
    {
        baseNote = _baseNote;
        basePitch = _basePitch;
    }
}
