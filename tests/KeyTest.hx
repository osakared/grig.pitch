package;

import grig.pitch.Key;
import tink.unit.Assert.*;

@:asserts
class KeyTest
{

    public function new()
    {
    }

    public function testAdd()
    {
        var key = C;
        return assert(key + 4 == E);
    }

    public function testAddWrap()
    {
        var key = C;
        return assert(key + 13 == Db);
    }

    public function testSubtract()
    {
        var key = A;
        return assert(key - 1 == Ab);
    }

    public function testSubtractWrap()
    {
        var key = C;
        return assert(key - 1 == B);
    }

    public function testWhiteKey()
    {
        var key = Db;
        return assert(key.isBlackKey());
    }

}
