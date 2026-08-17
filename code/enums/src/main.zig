const std = @import("std");
const Io = std.Io;

const enums = @import("enums");

test "enums" {
    const States = enum {prepare, iterate, calculate, terminate};
    const ListOfStates = std.enums.values(States);

    // Now I can iterate over the States. The "state" variable
    // also has the correct type.

    for (ListOfStates) |state| {
        if (state == States.calculate) {
            // etc.
            std.debug.print("arg: {s}", .{@tagName(state)});

        }
    }
}