package grig.pitch;

/**
 * Represents the note or pitch class
 */
enum abstract PitchClass(Int) to Int
{
    var C = 0;
    var Db = 1;
    var D = 2;
    var Eb = 3;
    var E = 4;
    var F = 5;
    var Gb = 6;
    var G = 7;
    var Ab = 8;
    var A = 9;
    var Bb = 10;
    var B = 11;

    private inline function new(val:Int)
    {
        this = val;
    }

    public static inline function fromSemitones(semitones:Int):PitchClass
    {
        while (semitones < 0) semitones += 12;
        return new PitchClass(semitones % 12);
    }

    /**
     * Adds semitons
     * @param semitones 
     * @return PitchClass
     */
    @:op(A+B)
    private inline function add(semitones:Int):PitchClass
    {
        return PitchClass.fromSemitones(this + semitones);
    }

    /**
     * Subtracts semitones
     * @param semitones 
     * @return PitchClass
     */
    @:op(A-B)
    private inline function subtract(semitones:Int):PitchClass
    {
        return PitchClass.fromSemitones(this - semitones);
    }

    public function toString(notation:PitchClassNotationType = Dutch):String
    {
        return switch notation {
            case Dutch:
                switch this {
                    case C: 'C';
                    case Db: 'C#';
                    case D: 'D';
                    case Eb: 'D#';
                    case E: 'E';
                    case F: 'F';
                    case Gb: 'F#';
                    case G: 'G';
                    case Ab: 'G#';
                    case A: 'A';
                    case Bb: 'A#';
                    case B: 'B';
                    default: 'unknown';
                }
            case Soflege:
                switch this {
                    case C: 'do';
                    case Db: 'do#';
                    case D: 're';
                    case Eb: 're#';
                    case E: 'mi';
                    case F: 'fa';
                    case Gb: 'fa#';
                    case G: 'sol';
                    case Ab: 'sol#';
                    case A: 'la';
                    case Bb: 'la#';
                    case B: 'si';
                    default: 'unknown';
                }
            case Sarega:
                switch this {
                    case C: 'Re';
                    case Db: 'Re Komal';
                    case D: 'Re';
                    case Eb: 'Ga Komal';
                    case E: 'Ga';
                    case F: 'Ma';
                    case Gb: 'Ma Tivra';
                    case G: 'Pa';
                    case Ab: 'Dha Komal';
                    case A: 'Dha';
                    case Bb: 'Ni Komal';
                    case B: 'Ni';
                    default: 'unknown';
                }
        }
    }

    public function isWhiteKey():Bool
    {
        return if ([C, D, E, F, G, A, B].contains(new PitchClass(this))) true;
        else false;
    }

    public function isBlackKey():Bool
    {
        return !isWhiteKey();
    }

}