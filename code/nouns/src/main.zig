const std = @import("std");
const Io = std.Io;

const nouns = @import("nouns");

const NounInt = union(enum) {
    Atom: Atom,
    CellAtomNoun: CellAtomNoun,
    CellAtomAtom: CellAtomAtom,
    CellNounNoun: CellNounNoun,
    CellNounAtom: CellNounAtom,
};

const NounishInt = union(enum) {
    Atom: Atom,
    Noun: i32
};

const Atom = struct {
    value: u32,
};

const CellAtomNoun = struct {
    head: Atom,
    tail: NounishInt
};

const CellAtomAtom = struct {
    head: Atom,
    tail: Atom,
};

const CellNounNoun = struct {
    head: NounishInt,
    tail: NounishInt,
};

const CellNounAtom = struct {
    head: NounishInt,
    tail: Atom,
};

pub fn main(init: std.process.Init) !void {
    _ = init.io;
}

test "computes an int" {
    _ = NounInt{ .Atom = .{ .value = 42 } };
    _ = NounInt{ .CellAtomNoun = .{ .head = .{ .value = 42 }, .tail = NounishInt{ .Atom = .{ .value = 43 } } } };
    _ = NounInt{ .CellAtomAtom = .{ .head = .{ .value = 42 }, .tail = .{ .value = 43 } } };
    _ = NounInt{ .CellNounNoun = .{ .head = NounishInt{ .Atom = .{ .value = 42 } }, .tail = NounishInt{ .Atom = .{ .value = 43 } } } };
    _ = NounInt{ .CellNounAtom = .{ .head = NounishInt{ .Noun = 44 }, .tail = .{ .value = 43 } } };
}