const std = @import("std");
const Io = std.Io;

const nouns = @import("nouns");

const Noun = union(enum) {
    Atom: Atom,
    Cell: Cell
};

const Atom = struct {
    value: u32,
};

const NounInt = union(enum) {
    Atom: Atom,
    CellAtomNoun: CellAtomNoun,
    CellAtomAtom: CellAtomAtom,
    CellNounNoun: CellNounNoun,
    CellNounAtom: CellNounAtom,
};

const NounU8 = union(enum) { // this will be different from NounInt, as it will be used for u8 values
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

const NounishU8 = union(enum) {
    Atom: Atom,
    Noun: u8
};

const Element = union(enum) {
    Int: NounInt,
    U8: NounU8,
    NounishInt: NounishInt,
    NounishU8: NounishU8,
};

pub const Cell = struct {
    const Self = @This();

    head: Element,
    tail: Element,

    pub fn new(comptime v: Element, comptime t: Element) Self {
        return .{ .head = v, .tail = t };
    }
};

const CellAtomNoun = struct {
    head: Atom,
    tail: NounishInt,
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

    // clean Cell class based on Element tagged union
    const element = Element{ .Int = NounInt{ .CellNounNoun = .{ .head = NounishInt{ .Atom = .{ .value = 42 } }, .tail = NounishInt{ .Atom = .{ .value = 43 } } } } };
    _ = Noun{ .Cell = .{ .head = element, .tail = element } };
    _ = Noun{ .Cell = Cell.new(element, element) };
    _ = Noun{ .Atom = .{ .value = 42 } };

    // intricacies based on reciprocal noun
    _ = NounInt{ .CellAtomNoun = .{ .head = .{ .value = 42 }, .tail = NounishInt{ .Atom = .{ .value = 43 } } } };
    _ = NounInt{ .CellAtomAtom = .{ .head = .{ .value = 42 }, .tail = .{ .value = 43 } } };
    _ = NounInt{ .CellNounNoun = .{ .head = NounishInt{ .Atom = .{ .value = 42 } }, .tail = NounishInt{ .Atom = .{ .value = 43 } } } };
    _ = NounInt{ .CellNounAtom = .{ .head = NounishInt{ .Noun = 44 }, .tail = .{ .value = 43 } } };
}