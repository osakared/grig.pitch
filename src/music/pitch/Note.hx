package music.pitch;

class Note
{
    public var midiNote(default, null):Int;

    // Private so you must be explicit about what you're creating it from
    private function new(_midiNote:Int)
    {
        midiNote = _midiNote;
    }

    static public function fromMidiNote(midiNote:Int)
    {
        return new Note(midiNote);
    }
}