package grig.pitch;

// western keys
@:enum
abstract Key(Int) from Int to Int {
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

    public inline function new(val:Int)
    {
        while (val < 0) val += 12;
        this = val % 12;
    }

    @:op(A+B)
    private inline function add(rhs:Int):Key
    {
        return new Key(this + rhs);
    }

    @:op(A-B)
    private inline function subtract(rhs:Int)
    {
        return new Key(this - rhs);
    }

}