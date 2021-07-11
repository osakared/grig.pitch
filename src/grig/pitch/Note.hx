package grig.pitch;

abstract Note(Int) to Int
{
    public var octave(get, never):Int;
    public var key(get, never):Key;

    private function get_octave():Int
    {
        return Math.floor(this / 12);
    }

    private function get_key():Int
    {
        return new Key(this % 12);
    }

    // Private so you must be explicit about what you're creating it from
    private function new(_midiNote:Int)
    {
        this = _midiNote;
    }

    static public function fromMidiNote(midiNote:Int):Note
    {
        return new Note(midiNote);
    }

    static public function fromKey(key:Key, octave:Int):Note
    {
        return new Note(octave * 12 + key);
    }

    @:op(A+B)
    private inline function add(rhs:Int):Note
    {
        return new Note(this + rhs);
    }

    @:op(A-B)
    private inline function subtract(rhs:Int):Note
    {
        return new Note(this - rhs);
    }
}