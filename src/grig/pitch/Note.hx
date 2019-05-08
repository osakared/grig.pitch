package grig.pitch;

class Note
{
    public var octave(get, never):Int;
    public var key(get, never):Key;
    public var midiNote(default, null):Int;

    private function get_octave():Int
    {
        return Math.floor(midiNote / 12);
    }

    private function get_key():Int
    {
        return new Key(midiNote % 12);
    }

    // Private so you must be explicit about what you're creating it from
    private function new(_midiNote:Int)
    {
        midiNote = _midiNote;
    }

    static public function fromMidiNote(midiNote:Int):Note
    {
        return new Note(midiNote);
    }

    static public function fromKey(key:Key, octave:Int):Note
    {
        return new Note(octave * 12 + key);
    }
}