package grig.pitch;

class Scale
{
    public var root(default, null):Key;
    public var third(get, never):Key; // for convenience
    public var fifth(get, never):Key;
    public var mode(default, null):Mode;

    public var notes(get, never):Array<Key>;
    public var intervals(get, never):Array<Int>;

    // modes in terms of how many semitones between intervals, starting with root
    public static var IONIAN_INTERVALS(default, null) =     [2, 2, 1, 2, 2, 2, 1]; // major
    public static var DORIAN_INTERVALS(default, null) =     [2, 1, 2, 2, 2, 1, 2];
    public static var PHRYGIAN_INTERVALS(default, null) =   [1, 2, 2, 2, 1, 2, 2];
    public static var LYDIAN_INTERVALS(default, null) =     [2, 2, 2, 1, 2, 2, 1];
    public static var MIXOLYDIAN_INTERVALS(default, null) = [2, 2, 1, 2, 2, 1, 2];
    public static var AEOLIAN_INTERVALS(default, null) =    [2, 1, 2, 2, 1, 2, 2]; // minor
    public static var LOCRIAN_INTERVALS(default, null) =    [1, 2, 2, 1, 2, 2, 2];

    public function new(_root:Key, _mode:Mode)
    {
        root = _root;
        mode = _mode;
    }

    public function get(degree:Int):Key
    {
        while (degree < 0) degree += 12;
        return notes[degree % 12];
    }

    private function get_third():Key
    {
        return notes[2];
    }

    private function get_fifth():Key
    {
        return notes[4];
    }

    private function get_notes():Array<Key>
    {
        var distanceFromRoot = 0;
        return [
            for (interval in intervals) {
                var oldDistance = distanceFromRoot;
                distanceFromRoot += interval;
                new Key(root + oldDistance);
            }
        ];
    }

    private function get_intervals():Array<Int>
    {
        return switch (mode) {
            case Ionian:     IONIAN_INTERVALS;
            case Dorian:     DORIAN_INTERVALS;
            case Phrygian:   PHRYGIAN_INTERVALS;
            case Lydian:     LYDIAN_INTERVALS;
            case Mixolydian: MIXOLYDIAN_INTERVALS;
            case Aeolian:    AEOLIAN_INTERVALS;
            case Locrian:    LOCRIAN_INTERVALS;
        }
    }
}
