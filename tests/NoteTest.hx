package;

import grig.pitch.Key;
import grig.pitch.Note;
import tink.unit.Assert.*;

@:asserts
class NoteTest
{

    public function new()
    {
    }

    public function testAdd()
    {
        var note = Note.fromMidiNote(59);
        note += 3;
        return assert(note.key == D);
    }

    public function testSubtract()
    {
        var note = Note.fromMidiNote(59);
        note -= 4;
        return assert(note.key == G);
    }

}