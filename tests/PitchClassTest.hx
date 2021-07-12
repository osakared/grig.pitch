package;

import grig.pitch.PitchClass;
import tink.unit.Assert.*;

@:asserts
class PitchClassTest
{

    public function new()
    {
    }

    public function testAdd()
    {
        var note = C;
        return assert(note + 4 == E);
    }

    public function testAddWrap()
    {
        var note = C;
        return assert(note + 13 == Db);
    }

    public function testSubtract()
    {
        var note = A;
        return assert(note - 1 == Ab);
    }

    public function testSubtractWrap()
    {
        var note = C;
        return assert(note - 1 == B);
    }

    public function testWhiteKey()
    {
        var note = Db;
        return assert(note.isBlackKey());
    }

    public function testSoflege()
    {
        var note = B;
        return assert(note.toString(Soflege) == 'si');
    }

}
