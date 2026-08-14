//! This module contains all functional programming functions.

pub const map = @import("map.zig").map;
pub const mapAlloc = @import("map.zig").mapAlloc;
pub const reduce = @import("reduce.zig").reduce;
pub const filter = @import("filter.zig").filter;
pub const some = @import("some.zig").some;
pub const every = @import("every.zig").every;
pub const find = @import("find.zig").find;
pub const rangeArray = @import("range.zig").rangeArray;
pub const rangeArrayList = @import("range.zig").rangeArrayList;
pub const rangeSlice = @import("range.zig").rangeSlice;
pub const takeNth = @import("take.zig").takeNth;
pub const common = @import("common.zig");
pub const adHocPoly = @import("polymorphism.zig").adHocPoly;
pub const adHocPolyT = @import("polymorphism.zig").adHocPolyT;

test {
    _ = @import("map.zig");
    _ = @import("reduce.zig");
    _ = @import("filter.zig");
    _ = @import("some.zig");
    _ = @import("every.zig");
    _ = @import("find.zig");
    _ = @import("range.zig");
    _ = @import("take.zig");
    _ = @import("common.zig");
    _ = @import("polymorphism.zig");
}
