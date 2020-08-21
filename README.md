# grig.pitch

[![pipeline status](https://gitlab.com/haxe-grig/grig.pitch/badges/main/pipeline.svg)](https://gitlab.com/haxe-grig/grig.pitch/commits/main)
[![Build Status](https://travis-ci.org/osakared/grig.pitch.svg?branch=main)](https://travis-ci.org/osakared/grig.pitch)
[![Gitter](https://badges.gitter.im/haxe-grig/Lobby.svg)](https://gitter.im/haxe-grig/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

See the [haxe grig documentation](https://grig.tech/)

!!! This is alpha currently. Don't depend on the interface not changing!

Just deals with calculating and otherwise dealing with pitches. Getting frequency from midi notes, etc.

## Some Design Goals

There is no one-size-fits-all for interfaces for music theory. Some concepts don't translate across paradigms so rigid class hierarchies are to be avoided (they're bad anyway). Some scales can interact with midi, some are from outside the occident and hence don't map well. Some are appropriate with multiple different types of temperament, some aren't. We should be humble in designing interfaces and not assume we know everything about music theory (I know I (tjw) sure don't!)

Interfaces should be flexible yet somehow also not confuse the crap out of someone who needs very basic music theory functionality (which is probably most use cases).

Unsure the best way to deal with this, but sometimes the correct answer to a music theory question is N/A. Nullability introduces the possibility of crashes but logically better than a bad answer. Enums are preferred where they make sense.

## Short-term TODOs:

* Implement enough functionality to enable a midi synth to work using this
* Provide some basic harmony functionality, like being able to get the degrees of a scale and getting idea of scale distance (circle of fifths)
* It should be easy to use this to make a little circle of fifths app
* Support returning correct pitches with input of pitch bend and pitch bend range

## Long-term TODOs:

* Definitely non-western/microtonal scales!
* Advanced music theory
