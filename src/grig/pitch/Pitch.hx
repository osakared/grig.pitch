package grig.pitch;

/**
 * Represents a pitch, in semitones but is agnostic about the actual absolute pitch
 */
abstract Pitch(Int)
{
    public var octave(get, never):Int;
    public var note(get, never):PitchClass;

    private function get_octave():Int
    {
        return Math.floor(this / 12);
    }

    private function get_note():PitchClass
    {
        return PitchClass.fromSemitones(this);
    }

    // Private so you must be explicit about what you're creating it from
    private inline function new(midiNote:Int)
    {
        this = midiNote;
    }

    static public inline function fromMidiNote(midiNote:Int):Pitch
    {
        return new Pitch(midiNote);
    }

    public inline function toMidiNote():Int
    {
        return this;
    }

    static public inline function fromNote(note:PitchClass, octave:Int):Pitch
    {
        return new Pitch(octave * 12 + note);
    }

    /**
     * Returns whether this is in the valid midi note range
     * @return Bool
     */
    public inline function isValidMidiNote():Bool
    {
        return this >= 0 && this <= 127;
    }

    @:op(A+B)
    private inline function add(rhs:Int):Pitch
    {
        return new Pitch(this + rhs);
    }

    @:op(A-B)
    private inline function subtract(rhs:Int):Pitch
    {
        return new Pitch(this - rhs);
    }
}