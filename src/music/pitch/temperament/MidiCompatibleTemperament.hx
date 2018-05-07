package music.pitch.temperament;

interface MidiCompatibleTemperament
{
    public function pitchFromMidiNote(midiNote:Int):Float;
}