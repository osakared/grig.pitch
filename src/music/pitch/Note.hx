package music.pitch;

class Note
{
    // This is not the best internal way to save.. maybe I want notes outside that range (unlikely) or
    // maybe I want microtonality/non-western notes (definitely a use case we want to support)
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